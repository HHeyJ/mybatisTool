package com.qmgyl.wm.generate;

import cn.org.rapid_framework.generator.GeneratorFacade;
import cn.org.rapid_framework.generator.GeneratorProperties;
import com.google.common.collect.Lists;

import java.util.Calendar;
import java.util.List;


public class RapidGenerator  {
    //java源代码路径
    public static final String JAVA_PATH ="javaPath";
    //源代码mybatis配置路径
    public static final String MYBATIS_XML_PATH ="mybatisXMLPath";
    //创建者
    public static final String AUTHOR ="author";
    //创建时间
    public static final String CREATETIME ="createTime";


    /**
     * 生成代码
     * @param projectPath 项目路径地址
     * @param author 作者 用系统变量中的USER
     * @param tableName 表名称
     * @throws Exception
     */
    public static void generatorOneTable(String projectPath, String author, String tableName)
            throws Exception {
        GeneratorFacade g = new GeneratorFacade();
        g.getGenerator().setTemplateRootDir(projectPath+ RapidConfig.TEMPLATE_ROOT_DIR);
        g.getGenerator().setOutRootDir(projectPath + RapidConfig.OUT_ROOT_DIR);
        GeneratorProperties
                .setProperty(RapidGenerator.JAVA_PATH, projectPath + RapidConfig.JAVA_PATH);
        GeneratorProperties.setProperty(RapidGenerator.MYBATIS_XML_PATH, projectPath+RapidConfig.MYBATIS_XML_PATH);
        //设置自己的名字
        GeneratorProperties.setProperty(RapidGenerator.AUTHOR,author);
        GeneratorProperties.setProperty(RapidGenerator.CREATETIME, RapidGenerator.getCreateTime());
        g.generateByTable(tableName);
    }

    private static String getCreateTime() {
        Calendar now = Calendar.getInstance();
        return now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH)+1)+"-"+now.get(Calendar.DAY_OF_MONTH);
    }

    public static void main(String[] args) throws Exception {
        String projectPath = System.getenv().get("PWD");
//        String author = System.getenv().get("USER")、、List<String> tableNames = Lists.newArrayList("inspection_standard","sub_task","relation_task_user","relation_sub_task","inspection_task_score");
        List<String> tableNames = Lists.newArrayList("join_info");

        for (String tableName : tableNames) {
            generatorOneTable(projectPath, AUTHOR, tableName);
        }
    }
}
