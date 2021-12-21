<?php
require 'db.php';
$offset = (int)$_REQUEST['page'];
$pageSize = 5;
$sql =  "SELECT * FROM `announcement` LIMIT $pageSize OFFSET $offset";
$result = $holder->query($sql);

foreach ($result as $IT): ?>
<div class="annsmnt">
    <p><?php print_r($IT['name_item'])?></p>
    <img src="pictures/<?php print_r($IT['picture'])?>" alt="no pic">
    <p>Price: <?php print_r($IT['price'])?>$</p>

    <button id="show_more">Show More</button>
</div>
<?php endforeach;
