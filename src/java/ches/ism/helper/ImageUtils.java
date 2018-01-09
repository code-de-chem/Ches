package ches.ism.helper;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

/**
 *
 * @author Saurabh Singh
 */
public class ImageUtils {
    
    public static void resize(File inputFile, String outputImagePath, int scaleWidth, int ScaleHeight) throws IOException{
        
        BufferedImage inputImage = ImageIO.read(inputFile);
        BufferedImage output = new BufferedImage(scaleWidth, ScaleHeight, inputImage.getType());
        
        String formatName = outputImagePath.substring(outputImagePath.lastIndexOf(".") + 1);
        ImageIO.write(output, formatName, new File(outputImagePath));
    }
    
}
