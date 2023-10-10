package com.lms.admin.lwm.mapper;

import com.lms.admin.lwm.dto.LwmDto;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface LwmMapper {
    public List<LwmDto> searchLwmList();
}
