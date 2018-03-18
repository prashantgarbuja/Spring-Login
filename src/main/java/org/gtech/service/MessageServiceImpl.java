package org.gtech.service;

import org.gtech.model.Message;
import org.gtech.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("messageService")
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageRepository messageRepository;
	
	@Override
	public void saveMessage(Message message) {
		messageRepository.save(message);
	}
	
	@Override
	public Message findMessageById(Integer id) {
		return messageRepository.findById(id);
	}
	
	@Override
	public void saveApproveStatus(Message message) {
		message.setStatus(true);
		messageRepository.save(message);
	}
	
	@Override
	public void saveDenyStatus(Message message) {
		message.setStatus(false);
		messageRepository.save(message);
	}
}
