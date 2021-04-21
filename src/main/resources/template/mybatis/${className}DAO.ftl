<#assign className=table.className/>
<#assign classNameLower = table.classNameFirstLower/>

<#macro mapperEl value type>${r"#{"}${value},jdbcType=${type}}</#macro>
<#macro mapperElPr value>${r"${"}${value}}</#macro>
${gg.setOverride(true)}<#t/>
${gg.setOutputFile(mybatisXMLPath+"/${className}DAO.xml")}<#t/>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${basepackage}.dao.${className}DAO">

	<resultMap id="BaseResultMap" type="${basepackage}.DO.${className}DO">
		<#list table.pkColumns as pk>
		<id property="${pk.columnNameFirstLower}" column="${pk.sqlName?upper_case}" jdbcType="${pk.jdbcSqlTypeName}" /><!--${pk.remarks}-->
		</#list>
		<#list table.notPkColumns as column>
		<result property="${column.columnNameFirstLower}" column="${column.sqlName?upper_case}" jdbcType="${column.jdbcSqlTypeName}" /><!--${column.remarks}-->
		</#list>
	</resultMap>

	<sql id="Base_Column_List">
		<#list  table.columns as column>
		`${column.sqlName?upper_case}`<#if column_has_next>,</#if>
		</#list>
	</sql>

	<insert id="insertSelective" parameterType="${basepackage}.DO.${className}DO" keyProperty="${table.pkColumns?first}" useGeneratedKeys="true">
		INSERT INTO `${table.sqlName}`
		<trim prefix="(" suffix=")" suffixOverrides=",">
					<@fieldIf/>
		</trim>
		<trim prefix="values (" suffix=")" suffixOverrides=",">
					<@propertyIf/>
		</trim>
	</insert>

	<update id="updateById">
		UPDATE `${table.sqlName}`
		<set>
				<@fieldEqPropertyIf/>
		</set>
		WHERE id = 1
	</update>

	<sql id="whereSQL">
    	<where>
    			<@fieldEqPropertyWhere/>
    	</where>
    </sql>

	<select id="queryByCondition" parameterType="com.qmgyl.wm.query" resultMap="BaseResultMap">
		SELECT <include refid="Base_Column_List"/>
		FROM `${table.sqlName}`
		<include refid="whereSQL"/>
	</select>

	<select id="countByCondition" parameterType="com.qmgyl.wm.query" resultType="java.lang.Long">
		SELECT count(1)
		FROM `${table.sqlName}`
		<include refid="whereSQL"/>
	</select>


</mapper>

<#macro idCnd pkColumns>
	<#compress>
		<#if pkColumns?? >
			<#if pkColumns?size==1 >
			${pkColumns?first.columnNameFirstLower}==null
			<#else >
				<#assign  index = 0 />
				<#list pkColumns as pk>
					<#if index == 0>
						<#assign  index = index+1/>
					${pk.columnNameFirstLower}==null
					<#else >
                    and  ${pk.columnNameFirstLower}
					</#if>
				</#list>
			</#if>
		</#if>
	</#compress>
</#macro>

<#macro idCndNotNull pkColumns>
		<#if pkColumns?? >
			<#if pkColumns?size==1 >
			<#assign  pk = pkColumns?first />
            <if test="${pk.columnNameFirstLower}!=null" >${pk.sqlName?upper_case}=<@mapperEl pk.columnNameFirstLower pk.jdbcSqlTypeName/></if>
			<#else >
				<#assign  index = 0 />
				<#list pkColumns as pk>
					<#if index == 0>
						<#assign  index = index+1/>
                    <if test="${pk.columnNameFirstLower}!=null" >${column.sqlName?upper_case}=<@mapperEl pk.columnNameFirstLower pk.jdbcSqlTypeName/></if>
					<#else >
                    <if test="${pk.columnNameFirstLower}!=null" >AND ${column.sqlName?upper_case}=<@mapperEl pk.columnNameFirstLower pk.jdbcSqlTypeName/></if>
					</#if>
				</#list>
			</#if>
		</#if>
</#macro>


<#macro field>
	<#list table.columns as column>
		`${column.sqlName?upper_case}`<#if column_has_next>,</#if>
	</#list>
</#macro>
<#macro property>
	<#list table.columns as column>
		<@mapperEl column.columnNameFirstLower column.jdbcSqlTypeName/><#if column_has_next>,</#if>
	</#list>
</#macro>

<#macro fieldIf>
	<#list table.columns as column>
		<if test="${column.columnNameFirstLower}!=null" >`${column.sqlName?upper_case}`<#if column_has_next>,</#if></if>
	</#list>
</#macro>
<#macro propertyIf>
	<#list table.columns as column>
		<if test="${column.columnNameFirstLower}!=null" ><@mapperEl column.columnNameFirstLower column.jdbcSqlTypeName/><#if column_has_next>,</#if></if>
	</#list>
</#macro>

<#macro fieldEqProperty>
	<#list table.columns as column>
		${column.sqlName?upper_case}=<@mapperEl column.columnNameFirstLower column.jdbcSqlTypeName/><#if column_has_next>,</#if>
	</#list>
</#macro>
<#macro fieldEqProperty>
	<#list table.columns as column>
		${column.sqlName?upper_case}=<@mapperEl column.columnNameFirstLower column.jdbcSqlTypeName/><#if column_has_next>,</#if>
	</#list>
</#macro>
<#macro fieldEqPropertyIf>
	<#list table.columns as column>
		<if test="${column.columnNameFirstLower}!=null" >`${column.sqlName?upper_case}`=<@mapperEl column.columnNameFirstLower column.jdbcSqlTypeName/><#if column_has_next>,</#if></if>
	</#list>
</#macro>
<#macro fieldEqPropertyWhere>
		<#assign  index = 0 />
		<#list table.columns as column>
			<#if index == 0>
				<#assign  index = index+1/>
			<if test="${column.columnNameFirstLower}!=null" >`${column.sqlName?upper_case}`=<@mapperEl column.columnNameFirstLower column.jdbcSqlTypeName/>   <#if column_has_next></#if></if>
			<#else >
	        <if test="${column.columnNameFirstLower}!=null" > AND `${column.sqlName?upper_case}`=<@mapperEl column.columnNameFirstLower column.jdbcSqlTypeName /><#if column_has_next></#if></if>
			</#if>
		</#list>
</#macro>

