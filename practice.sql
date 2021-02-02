# leetcode-database 第182题
select Email, count(Email) as num from Person group by Email;

# 方法一：
select Email from
(
	select Email, count(Email) as num from Person
	group by Email
) as statistic
where num > 1;

# 方法二：
select distinct p1.Email from Person as p1, Person as p2 
where p1.Email = p2.Email and p1.Id!=p2.Id;

# 方法二：
select Email from Person
group by Email having count(Email) > 1;

##########################################################

# leetcode-database 第176题
# 方法一：
SELECT
(SELECT DISTINCT Salary FROM Employee
	ORDER BY Salary DESC LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

# 方法二：
SELECT IFNULL(
				(SELECT DISTINCT Salary
					FROM Employee ORDER BY Salary DESC
					LIMIT 1 OFFSET 1
				), NULL
			 ) AS SecondHighestSalary;

# 方法三：
select max(Salary) SecondHighestSalary
from Employee where Salary < (select max(Salary) from Employee);

# 优先级：where>group by>having>order by

##########################################################

# leetcode-database 第1179题
SELECT id,
SUM(CASE `month` WHEN 'Jan' THEN revenue END) Jan_Revenue,
SUM(CASE `month` WHEN 'Feb' THEN revenue END) Feb_Revenue,
SUM(CASE `month` WHEN 'Mar' THEN revenue END) Mar_Revenue,
SUM(CASE `month` WHEN 'Apr' THEN revenue END) Apr_Revenue,
SUM(CASE `month` WHEN 'May' THEN revenue END) May_Revenue,
SUM(CASE `month` WHEN 'Jun' THEN revenue END) Jun_Revenue,
SUM(CASE `month` WHEN 'Jul' THEN revenue END) Jul_Revenue,
SUM(CASE `month` WHEN 'Aug' THEN revenue END) Aug_Revenue,
SUM(CASE `month` WHEN 'Sep' THEN revenue END) Sep_Revenue,
SUM(CASE `month` WHEN 'Oct' THEN revenue END) Oct_Revenue,
SUM(CASE `month` WHEN 'Nov' THEN revenue END) Nov_Revenue,
SUM(CASE `month` WHEN 'Dec' THEN revenue END) Dec_Revenue
FROM Department GROUP BY id;

##########################################################

# leetcode-database 第596题
# 方法一：
SELECT class FROM
(SELECT class, COUNT(DISTINCT student) AS num
	FROM courses GROUP BY class
) AS temp_table
WHERE num >= 5;

# 方法二：
SELECT class FROM courses
GROUP BY class HAVING COUNT(DISTINCT student) >= 5;

##########################################################

# leetcode-database 第175题
select FirstName,LastName, City, State
from Person left join Address on Person.PersonId = Address.PersonId;

##########################################################

# leetcode-database 第627题
UPDATE salary
SET sex =
CASE sex
	WHEN 'm' THEN 'f'
	ELSE 'm'
END;

##########################################################

# leetcode-database 第595题
SELECT name, population, area FROM world WHERE area > 3000000;
SELECT name, population, area FROM world WHERE population > 25000000;
# 使用OR将两个子查询合并在一起
# 方法一：
SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 25000000;

# 方法二：
SELECT name, population, area FROM world WHERE area > 3000000
UNION
SELECT name, population, area FROM world WHERE population > 25000000;

# 注：方法二比方法一运行速度更快，但是它们没有太大差别。
