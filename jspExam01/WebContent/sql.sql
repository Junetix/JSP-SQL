select * 
from emp,dept
where emp.sal=(select dept
					from deptno
					where deptno=20);
