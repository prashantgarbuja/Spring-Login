package org.gtech.service;

import org.gtech.model.Channel;
import org.gtech.repository.ChannelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("channelService")
public class ChannelServiceImpl implements ChannelService{
	
	@Autowired
	private ChannelRepository channelRepository;
	
	@Override
	public Channel findChannelById(int id) {
		return channelRepository.findById(id);
	}
	
	@Override
	public void saveChannel(Channel channel) {
		channelRepository.save(channel);
	}
	
	@Override
	public void deleteChannelById(int id) {
		channelRepository.deleteById(id);
	}

}
