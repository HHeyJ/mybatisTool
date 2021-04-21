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
${gg.setOverride(true)}<#t/>
${gg.setOutputFile(javaPath+"/query/"+className+"Query.java")}<#t/>
package ${basepackage}.query;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
* @author nanke
* @date ${createTime}
* 致终于来到这里的勇敢的人:
* 永远不要放弃！永远不要对自己失望！永远不要逃走辜负了自己。
* 永远不要哭啼！永远不要说再见！永远不要说慌来伤害目己。
*/
@Data
@EqualsAndHashCode(callSuper = false)
public class ${className}Query extends BaseQuery {

	<#list table.columns as column>
    /**
     * ${(column.remarks)!}
     */
	private ${column.simpleJavaType} ${column.columnNameLower};
	</#list>

}
<#macro generateJavaColumns>
    <#list table.columns as column>

    public void set${column.columnName}(${column.simpleJavaType} value) {
        this.${column.columnNameLower} = value;
    }

    public ${column.simpleJavaType} get${column.columnName}() {
        return this.${column.columnNameLower};
    }
    </#list>
</#macro>



