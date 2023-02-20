<?php
class Task
{
  private static $instance = null;
  public static $servername = "localhost";
  public static $username = "root";
  public static $password = "";
  public static $dbname = "todo";

  private $conn = null;

  private function __construct()
  {
    $this->conn = new mysqli(self::$servername, self::$username, self::$password, self::$dbname);
    if ($this->conn->connect_error) {
      die("Connection failed: " . $this->conn->connect_error);
    }
  }
  public static function getInstance()
  {
    if (self::$instance == null) {
      self::$instance = new Task();
    }
    return self::$instance;
  }
  public function getAllTasks()
  {
    $sql = "SELECT * FROM todolist ORDER BY 終了予定日";
    $result = $this->conn->query($sql);
    if (!$result) {
      die("Query Failed");
    }
    return $result;
  }
  public function addTask()
  {
    $length = self::getAllTasks()->num_rows;
    $id = $length + 1;
    $name = $_POST["name"];
    $due_date = $_POST["due_date"];
    $sql = "INSERT INTO `todolist` (`Id`, `タスク名`, `終了予定日`, `終了チェック`) VALUES ('$id', '$name', '$due_date', '0')";
    $result = $this->conn->query($sql);
    if (!$result) {
      die("Query Failed");
    }
    header("Location: index.php");
    return $result;
  }
  public function setDone()
  {
    $id = $_POST["done"];
    $sql = "UPDATE `todolist` SET `終了チェック` = '1' WHERE `todolist`.`Id` = '$id'";
    $result = $this->conn->query($sql);
    if (!$result) {
      die("Query Failed");
    }
    header("Location: index.php");
    return $result;
  }
  public function setUndone()
  {
    $id = $_POST["undone"];
    $sql = "UPDATE `todolist` SET `終了チェック` = '0' WHERE `todolist`.`Id` = '$id'";
    $result = $this->conn->query($sql);
    if (!$result) {
      die("Query Failed");
    }
    header("Location: index.php");
    return $result;
  }
  public function __destruct()
  {
    $this->conn->close();
  }
}

$task = Task::getInstance();
$result = $task->getAllTasks();

if (isset($_POST["name"]) && isset($_POST["due_date"])) {
  if (empty($_POST["name"]) || empty($_POST["due_date"])) {
    echo "タスク名と終了予定日は必須です";
    return;
  }
  $addTask = $task->addTask();
}

if (isset($_POST["done"])) {
  $setDone = $task->setDone();
}

if (isset($_POST["undone"])) {
  $setUndone = $task->setUndone();
}
?>

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TODOアプリ</title>
  <style>
    table {
      text-align: center;
      border-collapse: collapse;
    }

    table,
    th,
    td {
      border: 1px solid black;
    }

    th,
    td {
      padding: 5px;
    }
  </style>
</head>

<body>
  <h1>TODOアプリ</h1>
  <h2>タスクを追加する</h2>
  <form action="" method="POST">
    <label for="name">タスク名:</label>
    <input type="text" id="name" name="name" autocomplete="off">
    <label for="due_date">終了予定日:</label>
    <input type="date" id="due_date" name="due_date">
    <input type="submit" value="追加する">
    <p>
      <?php
      if (isset($addTask)) {
        echo "タスクを追加しました";
      }
      ?>
    </p>
  </form>
  <h2>タスク一覧</h2>
  <table>
    <tr>
      <th>ID</th>
      <th>タスク名</th>
      <th>終了予定日</th>
      <th>終了チェック</th>
    </tr>
    <?php
    if ($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["Id"] . "</td>";
        echo "<td>" . $row["タスク名"] . "</td>";
        echo "<td>" . $row["終了予定日"] . "</td>";
        if ($row["終了チェック"] == 1) {
          echo "<td>
          <input type='checkbox' name='done' value='1' checked>
          <form method='POST'>
              <button type='submit' name='undone' value='" . $row["Id"] . "'>キャンセル</button>
            </form>
          </td>";
        } else {
          echo "<td class='setDone'>
          <input type='checkbox' name='done' value='0'>
            <form method='POST'>
              <button type='submit' name='done' value='" . $row["Id"] . "'>完了</button>
            </form>
          </td>";
        }
        echo "</tr>";
      }
    }
    ?>
  </table>
</body>

</html>