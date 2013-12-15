class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :resolve, :report_issue]
  protect_from_forgery except: :index
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.where("resolved = 0").order(created_at: :desc)
    @resolved_tickets = Ticket.where("resolved = 1")
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @latlong = @ticket.location
    @location = @ticket.location
    if @latlong
      s = Geocoder.search(@latlong)
      if !s.empty?
        puts s.inspect
        @location = s.first.formatted_address
      end
    end
    @user = User.find(@ticket.user_id)
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    user = User.find_by_phone(params[:ticket][:phone])
    unless user
      user = User.new({:phone=>params[:ticket][:phone]})
    end
    user.tickets.build(ticket_params);
    respond_to do |format|
      if user.save
        format.html { redirect_to user.tickets.last , notice: 'Issue was successfully created.' }
        format.json { render json: 'created', status: :created}
      else
        format.html { render action: 'new' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end

  def approve
    
  end

  def resolve
    @ticket.resolved = 1
    respond_to do |format|
      if @ticket.save
        number_to_send_to = @ticket.user.phone
        if number_to_send_to.include? "9677973324"
          twilio_sid = "AC31a5d701b2a90db3f5ddf6456afa570f"
        twilio_token = "45aca855058d61d714fd70c24725051f"
        twilio_phone_number = "(580) 686-4593"
   
        @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
        @result = @twilio_client.account.sms.messages.create(
          :from => twilio_phone_number,
          :to => number_to_send_to,
          :body => "Your issue has been marked as resolved by mReport Admin. Have a great day!"
        )
        end
        format.html { redirect_to tickets_url, notice: 'Issue was successfully marked as resolved'}
      end
    end
  end

  def report_issue
    mode = params['ticket']['mode']
    @url = "http://lit-sierra-5396.herokuapp.com/tickets" + @ticket.id.to_s
    if mode == "0"
      number_to_send_to = params['ticket']['contact_no']
      twilio_sid = "AC31a5d701b2a90db3f5ddf6456afa570f"
      twilio_token = "45aca855058d61d714fd70c24725051f"
      twilio_phone_number = "(580) 686-4593"
 
      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
      @result = @twilio_client.account.sms.messages.create(
        :from => twilio_phone_number,
        :to => number_to_send_to,
        :body => "Issue has been reported in your ward #{params['ticket']['ward']}. Kindly visit #{@url} for more info."
      )
    else
      email = params['ticket']['contact_email']
      @user = User.find(params['ticket']['user_id'])
      UserMailer.report_mailer(@user,email,@ticket,@url).deliver
    end
    respond_to do |format|
        format.html { 
          redirect_to tickets_url, notice: 'Reported the issue'
        }
    end
  end

  def import
  Ticket.import(params[:file])
  redirect_to root_url, notice: "Tickets imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.fetch(:ticket,{}).permit(:description, :subject, :category, :user_id, :picture, :resolved, :location)
    end
end
