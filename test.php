<?php
namespace App\Http\Controllers\TableControllers;

use Illuminate\Routing\Controller;
use Illuminate\Foundation\Bus\DispatchesJobs;
use LaravelEnso\VueDatatable\app\Traits\Excel;
use LaravelEnso\VueDatatable\app\Traits\Datatable;

class ItemCardReservsTableController  extends Controller
{
    use DispatchesJobs, Datatable, Excel;

    protected $tableClass = ItemCardReservsTable::class;
}
