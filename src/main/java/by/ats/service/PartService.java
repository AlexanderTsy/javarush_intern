package by.ats.service;

import by.ats.entity.Part;

import java.util.List;

public interface PartService {

    public List getAllParts();
    public Part getPartById(Long id);
    public List getPageParts(int pageNum);
    public boolean savePart(Part part);
    public boolean deletePartById(Long id);
}
