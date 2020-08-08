package service;

import domain.Account;
import java.util.List;

public interface AccountService {

    List<Account> findAll(Integer start,Integer count);

    void saveAccount(Account account);

    void updateAccount(Account account);

    void deleteAccount(Integer accountId);

    List<Account> findAccountByName(String accountName,Integer start,Integer count);

    Account findAccountById(Integer accountid);

    Integer findTotal();

    Integer findTotalbyname(String name);
}
