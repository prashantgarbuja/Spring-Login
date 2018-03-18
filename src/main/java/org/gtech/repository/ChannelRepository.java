package org.gtech.repository;

import org.gtech.model.Channel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("channelRepository")
public interface ChannelRepository extends JpaRepository<Channel, Long> {

	Channel findById(int id);
	@Transactional
	Integer deleteById(int id);
}

