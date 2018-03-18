package org.gtech.service;

import org.gtech.model.Channel;

public interface ChannelService {
	public Channel findChannelById(int id);
	public void saveChannel(Channel channel);
	public void deleteChannelById(int id);
}
