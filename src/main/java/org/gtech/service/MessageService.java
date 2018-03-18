package org.gtech.service;

import org.gtech.model.Message;

public interface MessageService {
	public Message findMessageById(Integer id);
	public void saveMessage(Message message);
	public void saveApproveStatus(Message message);
	public void saveDenyStatus(Message message);

}
