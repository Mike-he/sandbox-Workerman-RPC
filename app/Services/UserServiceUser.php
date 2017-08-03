<?php
require_once __DIR__ . '/../../config/bootstrap.php';

/**
 *  测试
 * @author walkor <worker-man@qq.com>
 */
class UserServiceUser
{
    public static function test(
        $name = null,
        $orderBy = null,
        $director = null
    ) {
        global $entityManager;
        $re = $entityManager->createQueryBuilder('p')
            ->select('p')
            ->from('Entity\Product\Product', 'p');

        if (!is_null($name)) {
            $re->andWhere('p.name = :name')
                ->setParameter('name', $name);
        }

        if (!is_null($orderBy) && !is_null($director)) {
            $re->orderBy('p.'.$orderBy, $director);
        }

        return $re->getQuery()->getArrayResult();
    }

    public static function getInfoByUid($uid)
   {
       return array(
               'uid'    => $uid,
               'name'=> 'MyTest',
               'age'   => 18,
               'sex'    => 'hmadhwauhda',
               );
   }
   
   public static function getEmail($uid)
   {
       return '2233';
   }

    /**
     * @return mixed
     */
    public static function showTables()
   {
       global $db;
       /** @var \Medoo\Medoo $db */
       $all_tables = $db->query('show tables')->fetchAll();

       return $all_tables;
   }

   public static function showDevTables()
   {
       global $dev_db;
       /**
        * @var \Medoo\Medoo $dev_db
        */
//       $all_tables = $dev_db->select($this->userModel->table, [$this->userModel->F_id, $this->userModel->getPhone()], ['id' => 100]);
       $all_tables = $dev_db->select('user', ['id', 'phone'], ['id' => 100]);

//       foreach () {}

       return $all_tables;
   }
}
