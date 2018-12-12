# This code has been learned from http://crumbsofcode.com/turning-images-into-ascii-art-python/
# See detailed explanation ahead
from PIL import Image


def monochrome(imag, png):  # You use this Function to make Images Monochrome
    photo = Image.open(imag+png)  # Open Original Image
    photo = photo.convert('1')  # Converts Image to Monochrome
    return photo  # Generates the New Image


def readpixels(img, x, y):  # This Function reads the RGB Value of the images
    pixel = img.load()  # Saves the new image
    return pixel[x,y]  # Displays RGB Value


def makeascii(img, imag):  # With this function you convert Image to Ascii to review this watchhttps://whatis.techtarget.com/definition/ASCII-American-Standard-Code-for-Information-Interchange
    width, height = img.size  # Get Width and Height of the image
    x = 0  # x position of the image
    y = 0  # y position of the image

    chars = {0: '&', 255: ' '} # you set the character space to represent the color white and the & to represent the color black

    text_file = open(imgname+'.txt', 'w')  # you open a Text File

    while y <= height - 1:
        rgb = readpixels(img, x, y)  # This conditional statement reads the pixel at position x, y
        text_file.write(chars[rgb])  # Writes pixel as the characters you have established

        x += 1  # Increases x position by 1

        if x == width - 1:
            text_file.write('\n')  # Takes x to the next line and do it again
            x = 0
            y += 1  # takes y to next line and do it again

    text_file.close()


print("Convert your Ascii file here")
print("All files must be located in this folder")
imgname = input("Enter Image Name (without its file extension): ")  # Get User Chosen Image
extension = input("Enter its file extension (EX: .jpg}")

makeascii(monochrome(imgname, extension), imgname)

print("See the new image in your folder!")
