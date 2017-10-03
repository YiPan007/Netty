package nettydemo2;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.LineBasedFrameDecoder;
import io.netty.handler.codec.string.StringDecoder;

public class TimeClient {
	public void connect(int port,String host) throws Exception {
		EventLoopGroup group = new NioEventLoopGroup();
		try {
			Bootstrap b = new Bootstrap();
			b.group(group).channel(NioSocketChannel.class)
						  .option(ChannelOption.SO_BACKLOG, 1024)
						  .handler(new ChannelInitializer<SocketChannel>() {

							@Override
							protected void initChannel(SocketChannel arg0) throws Exception {
								arg0.pipeline().addLast(new LineBasedFrameDecoder(1024));
								arg0.pipeline().addLast(new StringDecoder());
								arg0.pipeline().addLast(new TimeClientHandler());
								
							}
						});
			ChannelFuture f = b.connect(host,port).sync();
			f.channel().closeFuture().sync();
		} finally {
			group.shutdownGracefully();
		}
	}
	public static void main(String[] args) throws Exception {
		int port =8089;
		try {
			if(args!=null && args.length>0) {
				port = Integer.valueOf(args[0]);	
			}
		} catch (Exception e) {
			
		}
		new TimeClient().connect(port, "127.0.0.1");
	}
}
