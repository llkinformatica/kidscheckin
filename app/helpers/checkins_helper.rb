require "rqrcode"

module CheckinsHelper

    def qrcode()

        qr = RQRCode::QRCode.new(current_usuario.codigo.to_s)

    end

end
