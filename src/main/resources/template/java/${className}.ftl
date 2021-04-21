<#assign className=table.className/>
<#assign classNameLower = table.classNameFirstLower/>

${gg.setOverride(true)}<#t/>
${gg.setOutputFile(javaPath+"/DO/"+className+"DO.java")}<#t/>
package ${basepackage}.DO;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;
import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
* @author nanke
* @date ${createTime}
* 致终于来到这里的勇敢的人:
* 永远不要放弃！永远不要对自己失望！永远不要逃走辜负了自己。
* 永远不要哭啼！永远不要说再见！永远不要说慌来伤害目己。
*/
@Data
public class ${className}DO implements Serializable {

	<#list table.columns as column>
    /**
     * ${(column.remarks)!}
     */
	private ${column.simpleJavaType} ${column.columnNameLower};
	</#list>

    public static ${className}DO convert(${className}DTO source) {
        if (source == null) {
            return null;
        }

        ${className}DO result = new ${className}DO();

        return result;
    }

    public static List<${className}DO> convert(List<${className}DTO> sources) {
        if (CollectionUtils.isEmpty(sources)) {
            return new ArrayList<>();
        }

        return sources.stream().map(${className}DO::convert).filter(Objects::nonNull).collect(Collectors.toList());
    }

    public static ${className}DTO convert(${className}DO source) {
        if (source == null) {
            return null;
        }

        ${className}DTO result = new ${className}DTO();

        return result;
    }

    public static List<${className}DTO> convert1(List<${className}DO> sources) {
        if (CollectionUtils.isEmpty(sources)) {
            return new ArrayList<>();
        }

         return sources.stream().map(${className}DO::convert).filter(Objects::nonNull).collect(Collectors.toList());
    }
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



