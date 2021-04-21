<#assign className=table.className/>
<#assign classNameLower = table.classNameFirstLower/>
<#--
<#if className?starts_with("WorkOrder")>
	<#assign className = className?substring(8)?cap_first/>
</#if>
<#if classNameLower?starts_with("workorder")>
	<#assign classNameLower = classNameLower?substring(8)?uncap_first/>
</#if>
-->
${gg.setOverride(false)}<#t/>
${gg.setOutputFile(javaPath+"/manager/"+className+"Manager.java")}<#t/>
package ${basepackage}.dao;

import ${basepackage}.DO.${className}DO;
import ${basepackage}.DTO.${className}DTO;
import ${basepackage}.query.${className}Query;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
* @author nanke
* @date ${createTime}
* 致终于来到这里的勇敢的人:
* 永远不要放弃！永远不要对自己失望！永远不要逃走辜负了自己。
* 永远不要哭啼！永远不要说再见！永远不要说慌来伤害目己。
*/
@Component
public class ${className}Manager {

    @Resource
    private ${className}DAO ${className}DAO;

    /**
    * 条件查询
    * @param query
    * @return
    */
    List"<"${className}DO">" queryByCondition(${className}Query query) {

    }

    /**
    * 新增
    * @param insertDO
    * @return
    */
    void insertSelective(${className}DO insertDO) {

    }

    /**
    * 主键更新
    * @param updateDO
    */
    void updateById(${className}DO updateDO) {

    }

    /**
    * 条件查询总数
    * @return
    */
    Long countByCondition(${className}Query query) {

    }

}