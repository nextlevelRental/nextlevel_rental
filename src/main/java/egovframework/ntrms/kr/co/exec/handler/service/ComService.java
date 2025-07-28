package egovframework.ntrms.kr.co.exec.handler.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.exec.handler.service.dao.ComDao;

/**
 * @author 강신규
 *
 */
@Service
public class ComService extends ServiceDaoBase {
	@Resource
	private ComDao dao;
	
	@Override
	public void init() {
		this.DEFAULT_DAO = dao;
	}
	
}
