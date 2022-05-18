package com.magnet.web_photos.webphotos.service;

import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;

@Service
public class DecompressService {
    public static byte[] decompress(byte[] input, boolean GZIPFormat)
            throws IOException, DataFormatException {

        // Create an Inflater object to compress the data
        Inflater decompressor = new Inflater(GZIPFormat);

        // Set the input for the decompressor
        decompressor.setInput(input);

        // Decompress data
        ByteArrayOutputStream bao = new ByteArrayOutputStream();
        byte[] readBuffer = new byte[1024];

        while (!decompressor.finished()) {
            int readCount = decompressor.inflate(readBuffer);
            if (readCount > 0) {
                // Write the data to the output stream
                bao.write(readBuffer, 0, readCount);
            }
        }

        // End the decompressor
        decompressor.end();
        // Return the written bytes from the output stream
        return bao.toByteArray();
    }
}
