/**
 * Copyright 2021 VMware, Inc.
 * SPDX-License-Identifier: BSD-2-Clause
*/
package com.vmware.flowgate.openmanage.redis;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.listener.ChannelTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.listener.adapter.MessageListenerAdapter;

import com.vmware.flowgate.common.model.redis.message.MessageReceiver;

@Configuration
public class RedisConfig {

   @Value("${adapter.topic}")
   private String topic;

   @Bean
   RedisMessageListenerContainer container(RedisConnectionFactory connectionFactory,
         MessageListenerAdapter generalListenerAdapter) {
      RedisMessageListenerContainer container = new RedisMessageListenerContainer();
      container.setConnectionFactory(connectionFactory);
      List<ChannelTopic> topics = new ArrayList<ChannelTopic>();
      topics.add(new ChannelTopic(topic));
      container.addMessageListener(generalListenerAdapter, topics);
      return container;
   }

   @Bean
   MessageListenerAdapter generalListenerAdapter(MessageReceiver receiver) {
      return new MessageListenerAdapter(receiver, "receiveMessage");
   }

   @Bean
   StringRedisTemplate template(RedisConnectionFactory connectionFactory) {
      return new StringRedisTemplate(connectionFactory);
   }
}
