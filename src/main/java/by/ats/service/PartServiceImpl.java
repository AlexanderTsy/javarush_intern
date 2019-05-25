package by.ats.service;

import by.ats.entity.Part;
import by.ats.repository.PartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class PartServiceImpl implements PartService {

    // Implementing
    private PartRepository repository;

    public PartServiceImpl() {

    }

    @Autowired
    public  PartServiceImpl(PartRepository repository) {
        super();
        this.repository = repository;
    }

    @Override
    public List getAllParts() {
        List list = new ArrayList();
        repository.findAll().forEach(e -> list.add(e));
        return list;
    }


    @Override
    public Part getPartById(Long id) {
        Part part = repository.findById(id).get();
        return part;
    }

    @Override
    public List getPageParts(int pageNum) {
        List list = new ArrayList();
        Page<Part> partPage;
        Pageable pageWithTenElements = PageRequest.of(pageNum,10);
        repository.findAll(pageWithTenElements).forEach(e -> list.add(e));
        return list;
    }

    @Override
    public boolean savePart(Part part) {
        try {
            repository.save(part);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public boolean deletePartById(Long id) {
        try {
            repository.deleteById(id);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
}
