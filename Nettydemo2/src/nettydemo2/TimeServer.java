package nettydemo2;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.LineBasedFrameDecoder;
import io.netty.handler.codec.string.StringDecoder;

public class TimeServer {
	public void bind(int port) throws Exception {
		EventLoopGroup bossgroup = new NioEventLoopGroup();
		EventLoopGroup workgroup = new NioEventLoopGroup();
		try {
			ServerBootstrap b = new ServerBootstrap();
			b.group(bossgroup,workgroup).channel(NioServerSocketChannel.class)
										.option(ChannelOption.SO_BACKLOG, 1024)
										.childHandler(new ChildChannelHandler());
			ChannelFuture f = b.bind(port).sync();
			f.channel().closeFuture().sync();
		} finally {
			bossgroup.shutdownGracefully();
			workgroup.shutdownGracefully();
		}
	}
	private class  ChildChannelHandler extends ChannelInitializer<SocketChannel>{

		@Override
		protected void initChannel(SocketChannel arg0) throws Exception {
			arg0.pipeline().addLast(new LineBasedFrameDecoder(1024));
			arg0.pipeline().addLast(new StringDecoder());
			arg0.pipeline().addLast(new TimeServerHandler());
			
		}
		
	}
	public static void main(String[] args) throws Exception {
		int port=8089;
		try {
			if(args!=null && args.length>0) {
				port = Integer.valueOf(args[0]);
			}
		} catch (Exception e) {
			
		}
		new TimeServer().bind(port);
	}
}
