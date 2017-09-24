package cn.Nio;

import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;

public class ByteBufferDemo {
	public static void readFile(String fileName) {
		try {
			RandomAccessFile randomAccessFile = new RandomAccessFile(fileName, "rw");
			FileChannel fileChannel = randomAccessFile.getChannel();
			ByteBuffer byteBuffer = ByteBuffer.allocate(24);
			int size = fileChannel.read(byteBuffer);
			while(size>0) {
				byteBuffer.flip();
				Charset charset = Charset.forName("utf-8");
				System.out.println(charset.newDecoder().decode(byteBuffer).toString());
				byteBuffer.clear();
				size = fileChannel.read(byteBuffer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
