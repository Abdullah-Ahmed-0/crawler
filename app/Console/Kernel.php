<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use App\Console\Commands\get_products;
use App\Http\Controllers\CrawlerController;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected $commands = [
        Commands\get_products::class,
    ];
    protected function schedule(Schedule $schedule)
    {
        // CrawlerController::getSpinneysProductsByCategory();
        // $schedule->command('inspire')->hourly();
        $schedule->call(function(){
        echo 'dd';
             CrawlerController::getSpinneysProductsByCategory();
        echo 'mm';
        })->everyFiveMinutes();
        $schedule->call(function(){
        echo 'tt';
             CrawlerController::update_arabic_products();
        echo 'gg';
        })->everyMinute();
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
