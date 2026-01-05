import qrcode
from qrcode.image.svg import SvgPathImage
from PIL import Image

def generate_qr_code(url, file_name="qr_code", box_size=10, border=4):
    """
    Generates a high-quality QR code for the given URL in both PNG and SVG formats.
    
    :param url: The URL to encode in the QR code.
    :param file_name: The base name of the file to save the QR code (default: qr_code).
    :param box_size: Size of each box in the QR code grid (default: 10).
    :param border: Thickness of the border around the QR code (default: 4).
    """
    try:
        # Create a QR code object with enhanced settings
        qr = qrcode.QRCode(
            version=1,  # Controls the size of the QR code (1 is smallest, up to 40 for the largest)
            error_correction=qrcode.constants.ERROR_CORRECT_H,  # Highest error correction
            box_size=box_size,  # Larger size for better quality
            border=border,  # Default or increased border for better readability
        )
        
        # Add data to the QR code
        qr.add_data(url)
        qr.make(fit=True)
        
        # Generate the PNG image
        img_png = qr.make_image(fill_color="black", back_color="white").convert("RGB")
        png_file = f"{file_name}.png"
        img_png.save(png_file, quality=100, dpi=(300, 300))  # High-quality PNG
        print(f"PNG QR code saved as {png_file}")
        
        # Generate the SVG image
        svg_file = f"{file_name}.svg"
        img_svg = qr.make_image(image_factory=SvgPathImage)
        img_svg.save(svg_file)
        print(f"SVG QR code saved as {svg_file}")
        
    except Exception as e:
        print(f"An error occurred: {e}")

# Main function to run the script
if __name__ == "__main__":
    # Input URL from the user
    url = input("Enter the URL to generate a QR code for: ")
    
    # Input file name (optional)
    file_name = input("Enter the base file name to save the QR code (default: qr_code): ") or "qr_code"
    
    # Input box size and border (optional)
    try:
        box_size = int(input("Enter box size for the QR code (default: 10): ") or 10)
        border = int(input("Enter border size for the QR code (default: 4): ") or 4)
    except ValueError:
        print("Invalid input! Using default box size and border.")
        box_size, border = 10, 4

    # Generate the QR code
    generate_qr_code(url, file_name, box_size, border)
