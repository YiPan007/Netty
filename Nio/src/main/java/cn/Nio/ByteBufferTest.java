package cn.Nio;

import org.junit.Test;

public class ByteBufferTest {
	@Test
	public void testByteBufferRW() {
		ByteBufferDemo.readFile("file/2.txt");
	}
}
