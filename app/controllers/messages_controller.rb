class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
    # チャットルームに紐付いている全てのメッセージ(@room.messages)????????
    # includes→N＋１問題を解決してくれる
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    # has_manyのアソシエーションを組んでいれば親モデルのインスタンスに紐づくモデルのインスタンスを生成できる
    # どれが子でどれが親？
    if @message.save
      redirect_to room_messages_path(@room)
      # ？？？？？？saveされたらredirect_toメソッドを用いてmessagesコントローラーのindexアクションに再度リクエストを送信し、新たにインスタンス変数を生成します。これによって保存後の情報に更新されます。
      # @roomの意味は？
    else
      @messages = @room.messages.includes(:user)

      render :index
      # indexに戻る
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
    # contentとimageをmessagesテーブルへ保存できるように。ユーザーidと紐付いているcontentを受け取れるようにする。imageという名前で送られてきた画像ファイルの保存を許可できる。そしてcreateで保存
    # margeメソッドでcurrent_userと紐付けする。
  end
end

# createアクション→DBに値を保存するための
# コントローラーの理解が乏しい
