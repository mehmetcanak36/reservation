<!-- Filter -->
<div class="container">
 
    <div class="row">
         
        <div class="col-sm-12">
        
            <ul class="nav nav-pills" id="filters">
            <h2 class="lined-heading"><span>kategoriler</span></h2>
                
                <li class="active"><a href="#" data-filter="*">Hepsi</a></li>
                <?php foreach ($room_categories as $room_category){ ?>
                    <li><a href="#" data-filter=".<?php echo get_class_name($room_category->title); ?>"><?php echo $room_category->title; ?> </a></li>
                <?php } ?>
            </ul>
            
        </div>
    </div>
</div>