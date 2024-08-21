from PIL import Image

def generate_thumbnail(image_paths, output_path):
    '''
    In order to use this script properly use `typst compile main.typ -f png thumbnail_{n}.png` 
    in order to create the images. After that execute the script and it will generate a long thumbnail.
    '''
    images = []
    
    # Open each image and append to the list
    for path in image_paths:
        image = Image.open(path)
        images.append(image)
    
    # Calculate the total width and height of the thumbnail
    total_width = sum(image.width for image in images)
    max_height = max(image.height for image in images)
    
    # Create a new image with the size of the thumbnail
    thumbnail = Image.new("RGB", (total_width, max_height))
    
    # Paste each image onto the new image
    x_offset = 0
    for image in images:
        thumbnail.paste(image, (x_offset, 0))
        x_offset += image.width
    
    # Save the thumbnail image
    thumbnail.save(output_path, "PNG")

def main():
    image_paths = ["thumbnail.png", "thumbnail_2.png", "thumbnail_3.png"]
    output_path = "thumbnail-long.png"
    generate_thumbnail(image_paths, output_path)

if __name__ == "__main__":
    main()
    

