package com.qmgyl.wm.query;

import lombok.Data;

/**
 * @author nanke
 * @date 2020/11/17 10:01 上午
 * 致终于来到这里的勇敢的人:
 * 永远不要放弃！永远不要对自己失望！永远不要逃走辜负了自己。
 * 永远不要哭啼！永远不要说再见！永远不要说慌来伤害目己。
 */
@Data
public class BaseQuery {

    /**
     * 页码
     */
    protected Integer pageNo = 1;
    /**
     * 每页个数
     */
    protected Integer pageSize = 10;
    /**
     * 偏移量
     */
    private Integer offset;

    /**
     * 分页数据偏移量
     */
    public Integer getOffset() {
        computeOffset();
        return offset;
    }

    /**
     * 计算分页偏移量
     */
    public void computeOffset(){
        if (null == pageNo || null == pageSize) {
            return ;
        }
        offset = (pageNo - 1) * pageSize;
    }
}
