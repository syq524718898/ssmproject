package dao;

import domain.Account;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 帐户dao接口
 */
@Repository
public interface AccountDao {

    //查询账户
    @Select("select * from account limit #{start},#{count}")
    List<Account> findAll(@Param("start")Integer start,@Param("count")Integer count);

    //保存账户
    @Insert("insert into account (name,money) values (#{name},#{money})")
    void saveAccount(Account account);

    //更新账户
    @Update("update account set name=#{name},money=#{money} where id=#{id}")
    int updateAccount(Account account);

    //删除账户
    @Delete("delete from account where id=#{acccountId}")
    int deleteAccount(Integer acccountId);


    //根据名称查询账户
    @Select("select * from account where name=#{accountName} limit #{start},#{count}")
    List<Account> findAccountByName(@Param("accountName") String accountName,@Param("start") Integer start,@Param("count") Integer count);

    //根据ID查询账户
    @Select("select * from account where id=#{accountid}")
    Account findAccountById(Integer accountid);

    //查询记录数
    @Select("select count(*) from account")
    Integer findTotal();

    //查询满足条件的记录数
    @Select("select count(*) from account where name=#{name}")
    Integer findTotalbyname(String name);
}
