MAS: sql vs nosql
=================

Kopieren der user-generated Data nach einem SP führt zu oracle errors

Aus dem Log:
2016-08-27 23:09:03,627 ERROR [t-http-bio-1701-exec-15] [c-PnxConstants] [O -(426417201,2758318,null)] - Failed to reflect method:collectionArray(...). No option to to escape this field 
2016-08-27 23:09:03,628 ERROR [t-http-bio-1701-exec-15] [c-PnxConstants] [O -(426417201,2758318,null)] - Failed to remove display fields that don't belong to institution from field:collection 
2016-08-27 23:09:03,628 WARN  [t-http-bio-1701-exec-15] [c-RecordDocDTO] [O -(426417201,2758318,null)] - Item ebi01_prod000597116 not have call number in browse section 
2016-08-27 23:09:03,629 ERROR [t-http-bio-1701-exec-15] [c-PnxConstants] [O -(426417201,2758318,null)] - Failed to reflect method:collectionArray(...). No option to to escape this field 
2016-08-27 23:09:03,630 ERROR [t-http-bio-1701-exec-15] [c-PnxConstants] [O -(426417201,2758318,null)] - Failed to remove display fields that don't belong to institution from field:collection 
2016-08-27 23:09:03,634 ERROR [t-http-bio-1701-exec-15] [c-JDBCExceptionReporter] [O -(426417201,2758318,null)] - ORA-00904: "THIS_"."LABEL": invalid identifier
 
2016-08-27 23:09:03,635 ERROR [t-http-bio-1701-exec-15] [c-BaseAction] [O -(426417201,2758318,null)] - Unexpected error - org.springframework.dao.InvalidDataAccessResourceUsageException: could not execute query; SQL [select this_.id as id29_0_, this_.TYPE as TYPE29_0_, this_.INSTITUTION as INSTITUT3_29_0_, this_.USER_ID as USER4_29_0_, this_.PNX_RECORD_ID as PNX5_29_0_, this_.FULL_LINK as FULL6_29_0_, this_.TITLE as TITLE29_0_, this_.AUTHOR as AUTHOR29_0_, this_.SUBJECT as SUBJECT29_0_, this_.ITEM_NOTE as ITEM10_29_0_, this_.U_FOLDER_ID as U11_29_0_, this_.LABEL as LABEL29_0_, this_.ORDER_WITHIN_FOLDER as ORDER13_29_0_, this_.PUBLICATION_DATE as PUBLICA14_29_0_, this_.JOURNAL_INFO as JOURNAL15_29_0_, this_.customerid as customerid29_0_, this_.institutionId as institu17_29_0_, this_.libraryId as libraryId29_0_, this_.CREATION_DATE as CREATION19_29_0_, this_.UPDATED_DATE as UPDATED20_29_0_, this_.UPDATED_BY as UPDATED21_29_0_ from U_BASKET this_ where this_.customerid=? and this_.institutionId=? and this_.USER_ID=? and this_.PNX_RECORD_ID=?]; nested exception is org.hibernate.exception.SQLGrammarException: could not execute query 
org.springframework.dao.InvalidDataAccessResourceUsageException: could not execute query; SQL [select this_.id as id29_0_, this_.TYPE as TYPE29_0_, this_.INSTITUTION as INSTITUT3_29_0_, this_.USER_ID as USER4_29_0_, this_.PNX_RECORD_ID as PNX5_29_0_, this_.FULL_LINK as FULL6_29_0_, this_.TITLE as TITLE29_0_, this_.AUTHOR as AUTHOR29_0_, this_.SUBJECT as SUBJECT29_0_, this_.ITEM_NOTE as ITEM10_29_0_, this_.U_FOLDER_ID as U11_29_0_, this_.LABEL as LABEL29_0_, this_.ORDER_WITHIN_FOLDER as ORDER13_29_0_, this_.PUBLICATION_DATE as PUBLICA14_29_0_, this_.JOURNAL_INFO as JOURNAL15_29_0_, this_.customerid as customerid29_0_, this_.institutionId as institu17_29_0_, this_.libraryId as libraryId29_0_, this_.CREATION_DATE as CREATION19_29_0_, this_.UPDATED_DATE as UPDATED20_29_0_, this_.UPDATED_BY as UPDATED21_29_0_ from U_BASKET this_ where this_.customerid=? and this_.institutionId=? and this_.USER_ID=? and this_.PNX_RECORD_ID=?]; nested exception is org.hibernate.exception.SQLGrammarException: could not execute query
        at org.springframework.orm.hibernate3.SessionFactoryUtils.convertHibernateAccessException(SessionFactoryUtils.java:635)
at org.springframework.orm.hibernate3.HibernateAccessor.convertHibernateAccessException(HibernateAccessor.java:412)
        at org.springframework.orm.hibernate3.HibernateTemplate.doExecute(HibernateTemplate.java:411)
        at org.springframework.orm.hibernate3.HibernateTemplate.executeWithNativeSession(HibernateTemplate.java:374)
        at org.springframework.orm.hibernate3.HibernateTemplate.findByCriteria(HibernateTemplate.java:1046)
        at org.springframework.orm.hibernate3.HibernateTemplate.findByCriteria(HibernateTemplate.java:1039)
        at com.exlibris.primo.server.persistence.HibernatePersistanceManager.findByCriteria(HibernatePersistanceManager.java:445)
        at sun.reflect.GeneratedMethodAccessor193.invoke(Unknown Source)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke(Method.java:498)
        at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:319)
        at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:183)
        at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:150)
        at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:110)
        at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:172)
        at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:202)
        at com.sun.proxy.$Proxy20.findByCriteria(Unknown Source)
        at com.exlibris.primo.management.eshelf.EshelfManager.findBasketItemByUserAndRecordID(EshelfManager.java:300)
        at com.exlibris.primo.management.eshelf.EshelfManager$$FastClassByCGLIB$$5b84430e.invoke(<generated>)
        at net.sf.cglib.proxy.MethodProxy.invoke(MethodProxy.java:149)
        at org.springframework.aop.framework.Cglib2AopProxy$CglibMethodInvocation.invokeJoinpoint(Cglib2AopProxy.java:689)
        at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:150)
        at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:110)
        at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:172)
        at org.springframework.aop.framework.Cglib2AopProxy$DynamicAdvisedInterceptor.intercept(Cglib2AopProxy.java:622)
        at com.exlibris.primo.management.eshelf.EshelfManager$$EnhancerByCGLIB$$ccb509c5.findBasketItemByUserAndRecordID(<generated>)
        at com.exlibris.primo.facade.eshelf.EshelfManagementFacade.findBasketItemByUserAndRecordID(EshelfManagementFacade.java:291)
        at com.exlibris.primo.facade.eshelf.EshelfManagementFacade$$FastClassByCGLIB$$eb2c3493.invoke(<generated>)
        at net.sf.cglib.proxy.MethodProxy.invoke(MethodProxy.java:149)
        at org.springframework.aop.framework.Cglib2AopProxy$CglibMethodInvocation.invokeJoinpoint(Cglib2AopProxy.java:689)
        at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:150)
        at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:110)
        at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:172)
        at org.springframework.aop.framework.Cglib2AopProxy$DynamicAdvisedInterceptor.intercept(Cglib2AopProxy.java:622)
        at com.exlibris.primo.facade.eshelf.EshelfManagementFacade$$EnhancerByCGLIB$$537adfbc.findBasketItemByUserAndRecordID(<generated>)
        at com.exlibris.primo.search.AbstractDisplayAction.updateBasketStatus(AbstractDisplayAction.java:792)
        at com.exlibris.primo.search.AbstractDisplayAction.processDisplay(AbstractDisplayAction.java:698)
        at com.exlibris.primo.search.AbstractDisplayAction.doExecute(AbstractDisplayAction.java:163)
        at com.exlibris.primo.deepLink.DisplayActionDL.doExecute(DisplayActionDL.java:154)
        at com.exlibris.primo.struts.PLBaseAction.doAction(PLBaseAction.java:104)
        at com.exlibris.primo.common.web.BaseAction.invokeAction(BaseAction.java:164)
        at com.exlibris.primo.common.web.BaseAction.execute(BaseAction.java:112)
        at org.apache.struts.action.RequestProcessor.processActionPerform(RequestProcessor.java:421)
        at org.apache.struts.action.RequestProcessor.process(RequestProcessor.java:226)
        at org.apache.struts.action.ActionServlet.process(ActionServlet.java:1164)
        at org.apache.struts.action.ActionServlet.doGet(ActionServlet.java:397)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:624)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:731)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at org.apache.catalina.filters.ExpiresFilter.doFilter(ExpiresFilter.java:1179)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.primo.common.web.filters.ClickjackFilter.doFilter(ClickjackFilter.java:47)
        at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:346)
        at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:259)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.primo.common.web.filters.spring.PrimoSaaSOpenSessionInViewFilter.doFilterInternal(PrimoSaaSOpenSessionInViewFilter.java:76)
        at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:76)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.primo.common.web.filters.ContentTypeHeaderFixerFilter.doFilter(ContentTypeHeaderFixerFilter.java:40)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.primo.common.web.utilities.SetCharacterEncodingFilter.doFilter(SetCharacterEncodingFilter.java:59)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.primo.common.web.filters.SecurityFilter.doFilter(SecurityFilter.java:115)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.primo.srvinterface.PrimoRunMode.doFilter(PrimoRunMode.java:71)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.primo.filters.NewSessionFilter.doFilter(NewSessionFilter.java:298)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.primo.filters.MenuSelectionFilter.doFilter(MenuSelectionFilter.java:52)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.wildebeast.filters.MaxRequestsFilter.doFilter(MaxRequestsFilter.java:88)
        at com.exlibris.primo.filters.AccessLimitFilter.doFilter(AccessLimitFilter.java:97)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.wildebeast.filters.MaxRequestsFilter.doFilter(MaxRequestsFilter.java:88)
        at com.exlibris.primo.filters.AccessLimitFilter.doFilter(AccessLimitFilter.java:97)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.wildebeast.filters.BlackListFilter.doFilter(BlackListFilter.java:47)
        at com.exlibris.primo.filters.BlockedUsersFilter.doFilter(BlockedUsersFilter.java:61)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.primo.common.web.filters.LockedThreadsFilter.doFilter(LockedThreadsFilter.java:69)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.primo.common.web.filters.MaxThreadsFilter.doFilter(MaxThreadsFilter.java:347)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.primo.common.web.filters.IPBlockFilter.doFilter(IPBlockFilter.java:52)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.primo.common.web.filters.XForwardedFilter.doFilter(XForwardedFilter.java:42)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at com.exlibris.primo.filters.CachedInputStreamFilter.doFilter(CachedInputStreamFilter.java:47)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:220)
        at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:122)
        at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:505)
        at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:170)
        at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:103)
        at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:957)
        at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116)
        at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:423)
        at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1079)
        at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:620)
        at org.apache.tomcat.util.net.JIoEndpoint$SocketProcessor.run(JIoEndpoint.java:316)
        at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
        at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
        at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
        at java.lang.Thread.run(Thread.java:745)
Caused by: org.hibernate.exception.SQLGrammarException: could not execute query
        at org.hibernate.exception.SQLStateConverter.convert(SQLStateConverter.java:67)
        at org.hibernate.exception.JDBCExceptionHelper.convert(JDBCExceptionHelper.java:43)
        at org.hibernate.loader.Loader.doList(Loader.java:2214)
        at org.hibernate.loader.Loader.listIgnoreQueryCache(Loader.java:2095)
        at org.hibernate.loader.Loader.list(Loader.java:2090)
        at org.hibernate.loader.criteria.CriteriaLoader.list(CriteriaLoader.java:95)
        at org.hibernate.impl.SessionImpl.list(SessionImpl.java:1569)
        at org.hibernate.impl.CriteriaImpl.list(CriteriaImpl.java:283)
        at org.springframework.orm.hibernate3.HibernateTemplate$36.doInHibernate(HibernateTemplate.java:1056)
        at org.springframework.orm.hibernate3.HibernateTemplate$36.doInHibernate(HibernateTemplate.java:1)
        at org.springframework.orm.hibernate3.HibernateTemplate.doExecute(HibernateTemplate.java:406)
        ... 122 more
Caused by: java.sql.SQLSyntaxErrorException: ORA-00904: "THIS_"."LABEL": invalid identifier

        at oracle.jdbc.driver.T4CTTIoer.processError(T4CTTIoer.java:445)
        at oracle.jdbc.driver.T4CTTIoer.processError(T4CTTIoer.java:396)
        at oracle.jdbc.driver.T4C8Oall.processError(T4C8Oall.java:879)
        at oracle.jdbc.driver.T4CTTIfun.receive(T4CTTIfun.java:450)
        at oracle.jdbc.driver.T4CTTIfun.doRPC(T4CTTIfun.java:192)
        at oracle.jdbc.driver.T4C8Oall.doOALL(T4C8Oall.java:531)
        at oracle.jdbc.driver.T4CPreparedStatement.doOall8(T4CPreparedStatement.java:207)
        at oracle.jdbc.driver.T4CPreparedStatement.executeForDescribe(T4CPreparedStatement.java:884)
        at oracle.jdbc.driver.OracleStatement.executeMaybeDescribe(OracleStatement.java:1167)
        at oracle.jdbc.driver.OracleStatement.doExecuteWithTimeout(OracleStatement.java:1289)
        at oracle.jdbc.driver.OraclePreparedStatement.executeInternal(OraclePreparedStatement.java:3584)
        at oracle.jdbc.driver.OraclePreparedStatement.executeQuery(OraclePreparedStatement.java:3628)
        at oracle.jdbc.driver.OraclePreparedStatementWrapper.executeQuery(OraclePreparedStatementWrapper.java:1493)
        at org.hibernate.jdbc.AbstractBatcher.getResultSet(AbstractBatcher.java:186)
        at org.hibernate.loader.Loader.getResultSet(Loader.java:1778)
        at org.hibernate.loader.Loader.doQuery(Loader.java:662)
        at org.hibernate.loader.Loader.doQueryAndInitializeNonLazyCollections(Loader.java:224)
        at org.hibernate.loader.Loader.doList(Loader.java:2211)
        ... 130 more
2016-08-27 23:09:03,655 ERROR [t-http-bio-1701-exec-2] [c-ErrorAction] [O -(426417201,2758318,null)] - Server Error :null 
2016-08-27 23:09:03,655 ERROR [t-http-bio-1701-exec-2] [c-ErrorAction] [O -(426417201,2758318,null)] - When asking for resource :null 