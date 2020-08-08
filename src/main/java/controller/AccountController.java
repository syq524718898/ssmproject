package controller;

import domain.Account;
import domain.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.AccountService;

/**
 * 帐户web
 */
@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("add")
    public String add()
    {
        return "add";
    }

    @RequestMapping("/addAccount")
    public String save(Account account)
    {
        accountService.saveAccount(account);
        return "redirect:/account/findAll";
    }

    @RequestMapping("/update")
    public String update(Integer id,Model model)
    {
        Account accountById = accountService.findAccountById(id);
        model.addAttribute("account",accountById);
        return "update";
    }

    @RequestMapping("/updatesubmit")
    public String updatesubmit(Account account)
    {
        accountService.updateAccount(account);
        return "redirect:/account/findAll";
    }

    @RequestMapping("findAll")
    public String findAll(Integer page,String name,Model model)
    {
        PageBean<Account> pb = new PageBean<>();
        if (page==null || "".equals(page))
        {
            pb.setCurrentPage(1);
        }
        else
        {
            pb.setCurrentPage(page);
        }

        if (name==null || "".equals(name))
        {
            pb.setList(accountService.findAll((pb.getCurrentPage()-1)*pb.getRows(),pb.getRows()));
            pb.setTotalCount(accountService.findTotal());
            pb.setTotalPage(pb.getTotalCount()%pb.getRows()==0?pb.getTotalCount()/pb.getRows():pb.getTotalCount()/pb.getRows()+1);
        }
        else
        {
            pb.setList(accountService.findAccountByName(name,(pb.getCurrentPage()-1)*pb.getRows(),pb.getRows()));
            pb.setTotalCount(accountService.findTotalbyname(name));
            pb.setTotalPage(pb.getTotalCount()%pb.getRows()==0?pb.getTotalCount()/pb.getRows():pb.getTotalCount()/pb.getRows()+1);
        }
        model.addAttribute("condion",name);
        model.addAttribute("pb",pb);
        return "list";
    }

    @RequestMapping("delAccount")
    public String delAccount(Integer id)
    {
        accountService.deleteAccount(id);
        return "redirect:/account/findAll";
    }

    @RequestMapping("delSelect")
    public String delSelect(String[] aid)
    {
        for (String id : aid) {
            accountService.deleteAccount(Integer.parseInt(id));
        }
        return "redirect:/account/findAll";
    }
}
