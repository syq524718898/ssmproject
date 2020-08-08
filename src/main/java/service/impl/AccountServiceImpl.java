package service.impl;

import dao.AccountDao;
import domain.Account;
import service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service("accountService")
public class AccountServiceImpl implements AccountService{

    @Autowired
    private AccountDao accountDao;
    @Override
    public List<Account> findAll(Integer start,Integer count) {
        return accountDao.findAll(start,count);
    }
    @Override
    public void saveAccount(Account account) {
        accountDao.saveAccount(account);
    }
    @Override
    public void updateAccount(Account account) {
        accountDao.updateAccount(account);
    }
    @Override
    public void deleteAccount(Integer accountId) {
        accountDao.deleteAccount(accountId);
    }
    @Override
    public List<Account> findAccountByName(String accountName,Integer start,Integer count) {
        return accountDao.findAccountByName(accountName,start,count);
    }
    @Override
    public Account findAccountById(Integer accountid) {
        return accountDao.findAccountById(accountid);
    }
    @Override
    public Integer findTotal() {
        return accountDao.findTotal();
    }
    @Override
    public Integer findTotalbyname(String name) {
        return accountDao.findTotalbyname(name);
    }
}
