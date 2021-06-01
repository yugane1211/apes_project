package com.spring.beans;


import java.io.InputStream;
import java.util.Properties;

import javax.activation.FileTypeMap;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;


public class MailBean extends JavaMailSenderImpl{

	@Override
	public void setJavaMailProperties(Properties javaMailProperties) {
		// TODO Auto-generated method stub
		super.setJavaMailProperties(javaMailProperties);
	}

	@Override
	public Properties getJavaMailProperties() {
		// TODO Auto-generated method stub
		return super.getJavaMailProperties();
	}

	@Override
	public synchronized void setSession(Session session) {
		// TODO Auto-generated method stub
		super.setSession(session);
	}

	@Override
	public synchronized Session getSession() {
		// TODO Auto-generated method stub
		return super.getSession();
	}

	@Override
	public void setProtocol(String protocol) {
		// TODO Auto-generated method stub
		super.setProtocol(protocol);
	}

	@Override
	public String getProtocol() {
		// TODO Auto-generated method stub
		return super.getProtocol();
	}

	@Override
	public void setHost(String host) {
		// TODO Auto-generated method stub
		super.setHost(host);
	}

	@Override
	public String getHost() {
		// TODO Auto-generated method stub
		return super.getHost();
	}

	@Override
	public void setPort(int port) {
		// TODO Auto-generated method stub
		super.setPort(port);
	}

	@Override
	public int getPort() {
		// TODO Auto-generated method stub
		return super.getPort();
	}

	@Override
	public void setUsername(String username) {
		// TODO Auto-generated method stub
		super.setUsername(username);
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return super.getUsername();
	}

	@Override
	public void setPassword(String password) {
		// TODO Auto-generated method stub
		super.setPassword(password);
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return super.getPassword();
	}

	@Override
	public void setDefaultEncoding(String defaultEncoding) {
		// TODO Auto-generated method stub
		super.setDefaultEncoding(defaultEncoding);
	}

	@Override
	public String getDefaultEncoding() {
		// TODO Auto-generated method stub
		return super.getDefaultEncoding();
	}

	@Override
	public void setDefaultFileTypeMap(FileTypeMap defaultFileTypeMap) {
		// TODO Auto-generated method stub
		super.setDefaultFileTypeMap(defaultFileTypeMap);
	}

	@Override
	public FileTypeMap getDefaultFileTypeMap() {
		// TODO Auto-generated method stub
		return super.getDefaultFileTypeMap();
	}

	@Override
	public void send(SimpleMailMessage simpleMessage) throws MailException {
		// TODO Auto-generated method stub
		super.send(simpleMessage);
	}

	@Override
	public void send(SimpleMailMessage... simpleMessages) throws MailException {
		// TODO Auto-generated method stub
		super.send(simpleMessages);
	}

	@Override
	public MimeMessage createMimeMessage() {
		// TODO Auto-generated method stub
		return super.createMimeMessage();
	}

	@Override
	public MimeMessage createMimeMessage(InputStream contentStream) throws MailException {
		// TODO Auto-generated method stub
		return super.createMimeMessage(contentStream);
	}

	@Override
	public void send(MimeMessage mimeMessage) throws MailException {
		// TODO Auto-generated method stub
		super.send(mimeMessage);
	}

	@Override
	public void send(MimeMessage... mimeMessages) throws MailException {
		// TODO Auto-generated method stub
		super.send(mimeMessages);
	}

	@Override
	public void send(MimeMessagePreparator mimeMessagePreparator) throws MailException {
		// TODO Auto-generated method stub
		super.send(mimeMessagePreparator);
	}

	@Override
	public void send(MimeMessagePreparator... mimeMessagePreparators) throws MailException {
		// TODO Auto-generated method stub
		super.send(mimeMessagePreparators);
	}

	@Override
	public void testConnection() throws MessagingException {
		// TODO Auto-generated method stub
		super.testConnection();
	}

	@Override
	protected void doSend(MimeMessage[] mimeMessages, Object[] originalMessages) throws MailException {
		// TODO Auto-generated method stub
		super.doSend(mimeMessages, originalMessages);
	}

	@Override
	protected Transport connectTransport() throws MessagingException {
		// TODO Auto-generated method stub
		return super.connectTransport();
	}

	@Override
	protected Transport getTransport(Session session) throws NoSuchProviderException {
		// TODO Auto-generated method stub
		return super.getTransport(session);
	}
	
	
	
}
