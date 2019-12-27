<?php
defined('IN_PHPCMS') or exit('No permission resources.');
/**
 * 数据库操作类
 *  
 * #版权声明 
 * 本类基于LGPL协议发布，您可以随意使用于商业和非商业项目，同时享有修改后再分发的权利。 
 * <http://www.gnu.org/licenses/lgpl.html> 
 *  
 * -------------- 
 *  
 * #安装 
 * ##复制文件 
 * 请把本类复制到以下目录中 
 * /phpcms/libs/classes/  
 * ##修改 
 * /phpcms/libs/functions/extention.func.php 在其顶部加入  
 *  
 * 	pc_base::load_sys_class('db', '', 0); 
 * 	 
 * 以保证类库被正常加载。 
 *  
 * ------------- 
 *  
 * #使用 
 * ##获取操作实例 
 * 通过 db::getInstance() 来获取本类的操作实例。  
 * ##组成select语句 
 * 	db::getInstance()->select('id,catid,title')->from('news')->where(array('catid'=>1))->order('id desc')->limit(2)->queryAll(); 
 *  
 * 通过这个语句最后组成了以下的SQL语句 
 *  
 * 	SELECT id,catid,title FROM v9_news  WHERE  catid = '1'  ORDER BY id desc  LIMIT 2 
 *  
 * 让我们来一个更复杂的SQL语句吧 
 *  
 * 	db::getInstance()->select('n.title,c.catname,nd.copyfrom')->from('news n')->leftJoin('news_data nd', 'n.id=nd.id')->leftJoin('category c', 'n.catid = c.catid')->limit(5,2)->order('n.id asc')->queryAll(null, 'id'); 
 *  
 * 这之后生成的是一个相对复杂的SQL语句 
 *  
 * 	SELECT n.title,c.catname,nd.copyfrom FROM v9_news n LEFT JOIN v9_news_data nd ON n.id=nd.id LEFT JOIN v9_category c ON n.catid = c.catid  ORDER BY n.id asc  LIMIT 5,2 
 *  
 * 进行了2次left join三个表被联合在一起进行了查询。分别从news表中获取到了title,从category表中获取到了catname，从news_data表中获取到了copyfrom 
 *  
 * ##where语句 
 * 本类中包括2个可用于构成where语句的函数： 
 *  
 * * where 
 * * orWhere 
 *  
 * where函数使用的是and做为不同条件之间的链接符，而orWhere函数使用的是or做为不同条件之间的链接符，这是他们之间唯一的区别。 
 *  
 * ###用法 
 * 	where(array('uid'=>1)); 
 * 	where('uid', 1); 
 *  
 * 这两句语句是等价的他们最后生成出来的都将是 
 *  
 * 	uid = '1' 
 *  
 * 你也可以使用多个条件在一个where节点我 
 *  
 * 	where(array('uid >=' => 100, 'age <=' => 20, 'age >=' => 18)) 
 *  
 * 在这个where节点中我们不光以数组的形式使用了多个条件，而且我还使用了不同形式的匹配方式。它最终会生成以下的语句 
 *  
 * 	uid >= '100' and age <= '20' and age >= '18' 
 *  
 * 当然我们也可以使用多节点的方式 
 *  
 * 	where('uid >=', 100)->where('age <=', 20)->where('age >=', 18) 
 *  
 * 以实现相关的效果。 
 *  
 * 以下列表显示了字段名后支持的可用匹配符（不区分大小写）： 
 *  
 * * \> 
 * * < 
 * * = (不标明符号时，默认为=) 
 * * \>= 
 * * <= 
 * * <> 
 * * != 
 * * IS 
 * * IS NOT 
 * * LIKE 
 * * NOT LIKE 
 * * IN 
 * * NOT IN 
 * * BETWEEN 
 * * NOT BETWEEN 
 *  
 * 需要特别指出的是，当字段名后并没有指明使用哪个匹配符时，程序默认使用=（等号）做为匹配符。 
 *  
 *  
 * IN,NOT IN,BETWEEN,NOT BETWEEN使用这四个匹配符，值应该为`数组`。如： 
 *  
 * 	where(array('uid in'=>array(1,2,3)))  
 *  
 * 最后转化成SQL语句为 
 *  
 * 	uid in ('1','2','3') 
 *  
 * >BETWEEN,NOT BETWEEN应该为包含2个元素的`数组`。 
 *  
 *  
 *  
 * ##query 
 * 在前面的例子中大家已经看到每个组成SQL语句的语法最后都有一个queryAll函数本调用，本类中支持多种query函数 
 *  
 * * queryAll —— 获取所有匹配的数据 
 * * queryRow —— 获取匹配数据中的第一行 
 * * queryColumn —— 获取匹配数据中的第一列 
 * * queryScalar —— 获取匹配数据中的第一行，第一列 
 *  
 * >所有query都支持直接写sql语句，可我并不建议大家这样操作。 
 *  
 * ##find 
 * 类库在提供query等一系列通过组合生成SQL语句的强大工具时，也提供一些快速进行查询的接口函数 
 *  
 * * find —— 快速从单个数据表中的获取单条数据 
 * * findAll —— 快速从单个数据表中获取所有匹配的信息 
 *  
 * 	db::getInstance()->find('news', array('id in'=>array(1,2,3)), 'id desc'); 
 *  
 * ------ 
 *  
 *  `文档中并没有把所有的功能都讲得非常的详细，大家可以通过看源代码的方式来加深了解。`
 * 
 * @author chenzhouyu<chenzhouyu@qq.com>
 * @license http://www.gnu.org/licenses/lgpl.html LGPL
 */
class db {
    
    /**
     * 类的单例调用
     * @var array
     */
    private static $_instance = array();


    /**
     * select语句select部分
     * @var string
     */
    private $_select = '*';
    
    /**
     * select语句where部分
     * @var array
     */
    private $_where = array();
    
    /**
     * select join语句
     * @var string
     */
    private $_join = array();
    
    /**
     * order 语句
     * @var string 
     */
    private $_order = '';
    
    /**
     * group 语句
     * @var string 
     */
    private $_group = '';
    
    /**
     * limit 语句
     * @var string|array
     */
    private $_limit = '';
    
    /**
     * 最后执行的sql语句
     * @var string 
     */
    private $_lastSql = '';
    
    /**
     * 数据表名
     * @var string 
     */
    private $_tableName = '';
    
    /**
     * 数据库配置
     * @var array 
     */
    private $_dbConfig = array();
    
    /**
     * 数据库表前缀
     * @var string 
     */
    private $_tablePre = '';

    /**
     * 构造函数
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $name 数据库配置名
     */
    public function __construct($name = 'default') {
        $this->_dbConfig =& pc_base::load_config('database');
        if (!isset($this->_dbConfig[$name])) {
            $name = 'default';
        }
        $this->_tableName = $this->_dbConfig[$name]['tablepre'] . $this->_tableName;
        $this->_tablePre = $this->_dbConfig[$name]['tablepre'];
        $this->db = db_factory::get_instance($this->_dbConfig)->get_database($name);
    }
    
    /**
     * 获取本类的操作实例
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $config 数据库配置名
     * @return db
     */
    public static function getInstance($config = 'default') {
        if (!isset(self::$_instance[$config])) {
            self::$_instance[$config] = new db($config);
        }
        return self::$_instance[$config];
    }
    
    /**
     * 获取最后执行的SQL语句
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @return string
     */
    public function getLastSql() {
        return $this->_lastSql;
    }
    
    /**
     * 设置select的字段
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string|array $select 需要获取的数据
     * @return db
     */
    public function select($select = '*') {
        if (is_array($select)) {
            $this->_select = implode(',', $select);
        } else {
            $this->_select = $select;
        }
        return $this;
    }

    /**
     * 设置select语句表名
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $tableName 数据表名
     * @return db
     */
    public function from($tableName) {
        $this->_tableName = $this->_tablePre.$tableName;
        return $this;
    }
    
    /**
     * 加入join语句
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $tableName 表名
     * @param string $on on条件
     * @param string $type join类型
     * @return db
     */
    public function join($tableName, $on, $type = 'JOIN') {
        $this->_join[] = array(
            'type'=>$type,
            'tablename'=>$tableName,
            'on'=>$on
        );
        return $this;
    }
    
    /**
     * 加入left join语句
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $tableName 表名
     * @param string $on on条件
     * @return db
     */
    public function leftJoin($tableName, $on) {
        $this->join($tableName, $on, 'LEFT JOIN');
        return $this;
    }
    
    /**
     * 加入right join语句
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $tableName 表名
     * @param string $on on条件
     * @return db
     */
    public function rightJoin($tableName, $on) {
        $this->join($tableName, $on, 'RIGHT JOIN');
        return $this;
    }
    
    /**
     * 设置select语句where部分,使用and关联
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string|array $condition 查询条件
     * @param string $value 查询的值
     * @return db
     */
    public function where($condition, $value = '') {
        $this->_where($condition, $value, 'AND');
        return $this;
    }

    /**
     * 设置select语句where部分,使用or关联
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string|array $condition 查询条件
     * @param string $value 查询的值
     * @return db
     */
    public function OrWhere($condition, $value = '') {
        $this->_where($condition, $value, 'OR');
        return $this;
    }
    
    /**
     * 设置select语句where部分处理函数
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string|array $condition 查询条件
     * @param string $value 查询的值
     * @return db
     */
    private function _where($condition, $value = '', $connector = 'AND') {
        if (is_array($condition)) {
            foreach ($condition as $k=>$v) {
                $this->_where[' '.$connector.' '.$k] = $v;
            }
        } elseif (is_string($condition)) {
            if (empty($condition)) return false;
            if (is_null($value)) {
                $this->_where[] = ' '.$connector.' '.$condition;
            } else {
                $this->_where[' '.$connector.' '.$condition] = $value;
            }
        }
        return $this;
    }
    
    /**
     * order by语句
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $order
     * @return db
     */
    public function order($order) {
        $this->_order = $order;
        return $this;
    }
    
    /**
     * group by语句
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $group
     * @return db
     */
    public function group($group) {
        $this->_group = $group;
        return $this;
    }
    
    /**
     * limit语句
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param integer $start 开始位置，当只设置本变量时，本变量为获取条件
     * @param integer $num 获取条数
     * @return db
     */
    public function limit($start, $num = null) {
        if (isset($num)) {
            $this->_limit = array(intval($start),intval($num));
        } else {
            $this->_limit = intval($start);
        }
        return $this;
    }
    
    /**
     * 生成select sql语句
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @return string|boolean
     */
    private function _buildSql() {
        $sql = 'SELECT ';
        if (!empty($this->_select)) {
            $sql .= $this->_select;
        } else {
            $sql .= ' * ';
        }

        if (!empty($this->_tableName)) {
            $sql .= ' FROM ' . $this->_tableName . ' ';
        } else {
            return false;
        }

        if (!empty($this->_join)) {
            foreach ($this->_join as $v) {
                $sql .= $v['type'] . ' ' . $this->_tablePre . $v['tablename'] . ' ON ' . $v['on'] . ' ';
            }
        }

        if (!empty($this->_where)) {
            if ($where = $this->_buildWhereSql($this->_where)) {
                $sql .= ' WHERE '.$where;
            }
        }
        
        if (!empty($this->_group)) {
            $sql .= ' GROUP  BY '.$this->_group.' ';
        }
        
        if (!empty($this->_order)) {
            $sql .= ' ORDER BY '.$this->_order.' ';
        }
        
        if (!empty($this->_limit)) {
            $sql .= ' LIMIT '.(is_array($this->_limit) ? implode(',', $this->_limit) : $this->_limit);
        }
        
        return $sql;
    }
    
    /**
     * 生成where语句
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param array|string $param 条件
     * @return string
     */
    private function _buildWhereSql($param) {
        if (empty($param)) {
            return '';
        } elseif (is_string($param)) {
            return $param;
        }
        
        $where = '';
        $condition = array(
            12 => array(' NOT BETWEEN'),
            8 => array(' BETWEEN'),
            7 => array(' NOT IN'),
            3 => array(' IN'),
        );

        $v_condition = array(
            9 => array(' NOT LIKE'),
            7 => array(' IS NOT'),
            5 => array(' LIKE'),
            3 => array(' IS'),
            2 => array('>=', '<=', '<>', '!='),
            1 => array('>', '<', '='),
        );
        foreach ($param as $k => $v) {
            if (is_numeric($k)) {
                $where .= $v;
            } elseif (is_null($v)) {
                $where .= $k . ' IS NULL ';
                continue;
            } elseif (is_array($v)) {
                $connector = '';
                foreach ($condition as $a => $b) {
                    $tmp = strtoupper(substr($k, -$a));
                    if (in_array($tmp, $b)) {
                        $connector = $tmp;
                        break;
                    }
                }

                $v = array_map('mysql_escape_string', $v);

                if (in_array($connector, array(' BETWEEN', ' NOT BETWEEN'))) {
                    $where .= $k . $v[0] . ' AND ' . $v[1];
                } elseif (in_array($connector, array(' IN', ' NOT IN'))) {
                    $where .= $k . '(\'' . implode('\',\'', $v) . '\')';
                } else {
                    $where .= $k . ' IN (\'' . implode('\',\'', $v) . '\')';
                }
                continue;
            } else {
                $connector = '';
                foreach ($v_condition as $a => $b) {
                    $tmp = strtoupper(substr($k, -$a));
                    if (in_array($tmp, $b)) {
                        $connector = $tmp;
                        break;
                    }
                }

                if (!empty($connector)) {
                    $where .= $k . ' \'' . mysql_escape_string($v) . '\' ';
                } else {
                    $where .= $k . ' = \'' . mysql_escape_string($v) . '\' ';
                }
            }
        }

        if (!empty($where)) {
                $where = substr($where, 4);
        }

        return $where;
    }
    
    /**
     * 清空类中的变量
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     */
    private function _clean() {
        $this->_group = '';
        $this->_join = array();
        $this->_limit = '';
        $this->_order = '';
        $this->_select = '*';
        $this->_where = array();
    }


    /**
     * 从向数据库发起SQL执行请求
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $sql 需要执行的Sql语句
     * @param string $key 按key排序
     * @param string $name Description
     * @return array|boolean
     */
    private function _query($sql = null, $key = '', $column = false) {
        if (is_null($sql)) {
            if (!$sql = $this->_buildSql()) {
                return false;
            }
        }
        $limit = $this->_limit;
        $this->_clean();
        $this->_lastSql = $sql;
        
        $this->db->query($sql);
        
        if (!is_resource($this->db->lastqueryid)) {
            return $this->db->lastqueryid;
        }
        
        if ($column === true && ($limit == 1 || (is_array($limit) && $limit[1] == 1))) {
            $rs = mysql_fetch_row($this->db->lastqueryid);
            $rs = $rs[0];
        } else {
            $type = MYSQL_ASSOC;
            if ($column === true) {
                $type = MYSQL_NUM;
            }
            while (($tmp = $this->db->fetch_next($type)) != false) {
                if ($column === true) {
                    $rs[] = $tmp[0];
                } elseif (!empty($key) && isset($tmp[$key])) {
                    $rs[$tmp[$key]] = $tmp;
                } else {
                    $rs[] = $tmp;
                }
            }
        }
        $this->db->free_result();
        return $rs;
    }
    
    /**
     * 请求所有数据
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $sql sql语句
     * @param string $key 排序字段
     * @return array|boolean
     */
    public function queryAll($sql = null, $key = '') {
        return $this->_query($sql, $key);
    }
    
    /**
     * 获取第一行数据
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $sql sql语句
     * @return array|boolean
     */
    public function queryRow($sql = null) {
        if (!empty($this->_limit) && is_array($this->_limit)) {
            $this->_limit[1] = 1;
        } else {
            $this->limit(1);
        }
        if ($rs = $this->_query($sql)) {
            return $rs[0];
        }
        return false;
    }
    
    /**
     * 获取第一列数据
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $sql
     * @return array|boolean
     */
    public function queryColumn($sql = null) {
        return $this->_query($sql, '', true);
    }
    
    /**
     * 获取第一行第一列
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $sql
     * @return array|boolean
     */
    public function queryScalar($sql = null) {
        if (!empty($this->_limit) && is_array($this->_limit)) {
            $this->_limit[1] = 1;
        } else {
            $this->limit(1);
        }
        return $this->_query($sql, '', true);
    }
    
    /**
     * 快速从单个数据表中的获取单条数据
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $tableName 数据表名
     * @param array $condition 查询条件
     * @param string $order 排序方式
     * @return array|boolean 
     */
    public function find($tableName, $condition = array(), $order = '') {
        return $this->select()->from($tableName)->where($condition)->order($order)->queryRow();
    }
    
    /**
     * 快速从单个数据表中获取所有匹配的信息
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $tableName 表名
     * @param array $condition 查询条件
     * @param string $order 排序方式
     * @return array|boolean
     */
    public function findAll($tableName, $condition = array(), $order = '') {
        return $this->select()->from($tableName)->where($condition)->order($order)->queryAll();
    }
    
    /**
     * 获取数量
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $tableName 表名
     * @param array $condition 查询条件
     * @param string $column 计数字段
     * @return integer|boolean
     */
    public function count($tableName, $condition = array(), $column = '*') {
        return $this->select('COUNT('.$column.')')->from($tableName)->where($condition)->queryScalar();
    }
    
    /**
     * 查询数据是否存在
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $tableName 表名
     * @param array $condition 查询条件
     * @return boolean
     */
    public function exists($tableName = '', $condition = array()) {
        $this->select(1);
        
        if (!empty($tableName)) {
            $this->from($tableName);
        }
        
        if (!empty($condition)) {
            $this->where($condition);
        }
        
        if ($this->queryScalar()) {
            return true;
        } else {
            return false;
        }
    }
    
    /**
     * 向数据库中插入数据
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $tableName 表名
     * @param array $param 参数
     * @param boolean $replace 是否为Replace into
     * @return integer|boolean
     */
    public function insert($tableName, $param, $replace = false) {
        if (!empty($tableName) && !empty($param)) {
            $sql = ($replace === true ? 'REPLACE' : 'INSERT').' INTO '.$this->_tablePre.$tableName.' SET '.$this->_set($param);
            if ($this->_query($sql) !== false) {
                if ($id = $this->db->insert_id()) {
                    return $id;
                }
                return true;
            }
        }
        return false;
    }
    
    /**
     * 更新数据表中的数据
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $tableName 表名
     * @param array $param 参数
     * @param array $condition 条件
     * @return integer|boolean
     */
    public function update($tableName, $param, $condition) {
        if (!empty($tableName) && !empty($param) && !empty($condition)) {
            foreach ($condition as $k=>$v) {
                 $condition[' AND '.$k] = $v;
                 unset($condition[$k]);
             }
            $sql = "UPDATE ".$this->_tablePre.$tableName.' SET '.$this->_set($param).' WHERE '.$this->_buildWhereSql($condition);
            return $this->_query($sql);
        }
        return false;
    }
    
    /**
     * 删除指定数据
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param string $tableName 表名
     * @param array $condition 查询条件
     * @return boolean
     */
    public function delete($tableName, $condition) {
         if (!empty($tableName) && !empty($condition)) {
             foreach ($condition as $k=>$v) {
                 $condition[' AND '.$k] = $v;
                 unset($condition[$k]);
             }
             return $this->_query("DELETE FROM ".$this->_tablePre.$tableName.' WHERE '.$this->_buildWhereSql($condition));
         }
         return false;
    }


    /**
     * 组装生成set语句
     * 
     * @author chenzhouyu<chenzhouyu@qq.com>
     * @param array $param 参数
     * @return string
     */
    private function _set($param) {
        $sql = "";
        if (is_array($param) && !empty($param)) {
            foreach ($param as $k => $v) {
                $sql .= (!empty($sql) ? ', ' : '').$k.' = \''.mysql_escape_string($v).'\'';
            }
        }
        return $sql;
    }
}
?>
