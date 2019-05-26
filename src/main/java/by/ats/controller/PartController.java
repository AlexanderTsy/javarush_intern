package by.ats.controller;

import by.ats.entity.Part;
import by.ats.service.PartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class PartController {
    // Constructor based Dependency Injection
    private PartService partService;

    public PartController() {

    }

    @Autowired
    public PartController( PartService partService) {
        this.partService = partService;
    }

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public ModelAndView hello(HttpServletResponse response) throws IOException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("home");
        return mv;
    }

    //Get All Parts
    @RequestMapping(value = "/allParts", method = RequestMethod.POST)
    public ModelAndView displayAllPart() {
        System.out.println("Part Page Requested : All Parts");
        ModelAndView mv = new ModelAndView();
        List partLit = partService.getAllParts();
        mv.addObject("partList", partLit);
        mv.setViewName("allParts");
        return mv;
    }

    //Get All Parts JSON
    @RequestMapping(value = "/allPartsJson", method = RequestMethod.GET)
    public ModelAndView displayAllPartJson() {
        System.out.println("Part Page Requested : All Parts JSON");
        ModelAndView mv = new ModelAndView();
        List partLit = partService.getAllParts();
        mv.addObject("partList", partLit);
        mv.setViewName("allPartsJson");
        return mv;
    }

    @RequestMapping(value = "/addPart", method = RequestMethod.GET)
    public ModelAndView displayNewPartForm() {
        ModelAndView mv = new ModelAndView("addPart");
        mv.addObject("headerMessage", "Add Part Details");
        mv.addObject("part", new Part());
        return mv;
    }

    @RequestMapping(value = "/addPart", method = RequestMethod.POST)
    public ModelAndView saveNewPart(@ModelAttribute Part part, BindingResult result) {
        ModelAndView mv = new ModelAndView("redirect:/home");

        if (result.hasErrors()) {
            return new ModelAndView("error");
        }
        boolean isAdded = partService.savePart(part);
        if (isAdded) {
            mv.addObject("message", "New part successfully added");
        } else {
            return new ModelAndView("error");
        }

        return mv;
    }

    @RequestMapping(value = "/editPart/{id}", method = RequestMethod.GET)
    public ModelAndView displayEditPartForm(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("/editPart");
        Part part = partService.getPartById(id);
        mv.addObject("headerMessage", "Edit Part Details");
        mv.addObject("part", part);
        return mv;
    }

    @RequestMapping(value = "/editPart/{id}", method = RequestMethod.POST)
    public ModelAndView saveEditedUser(@ModelAttribute Part part, BindingResult result) {
        ModelAndView mv = new ModelAndView("redirect:/home");

        if (result.hasErrors()) {
            System.out.println(result.toString());
            return new ModelAndView("error");
        }
        boolean isSaved = partService.savePart(part);
        if (!isSaved) {

            return new ModelAndView("error");
        }

        return mv;
    }

    @RequestMapping(value = "/deletePart/{id}", method = RequestMethod.GET)
    public ModelAndView deletePartById(@PathVariable Long id) {
        boolean isDeleted = partService.deletePartById(id);
        System.out.println("Part deletion respone: " + isDeleted);
        ModelAndView mv = new ModelAndView("redirect:/home");
        return mv;

    }
}
