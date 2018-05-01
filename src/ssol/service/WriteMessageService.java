package ssol.service;

import java.sql.Connection;
import java.sql.SQLException;

import ssol.dao.MessageDao;
import ssol.dao.MessageDaoProvider;
import ssol.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class WriteMessageService {
	private static WriteMessageService instance = 
			new WriteMessageService();
	
	public static WriteMessageService getInstance() {
		return instance;
	}

	private WriteMessageService() {
	}
	
	public void write(Message message) throws ServiceException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = 
					MessageDaoProvider.getInstance().getMessageDao();
			messageDao.insert(conn, message);
		} catch (SQLException e) {
			throw new ServiceException(
					"�޽��� ��� ����: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
