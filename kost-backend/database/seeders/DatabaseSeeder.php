<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            UserSeeder::class,
            RoomSeeder::class,
            TenantSeeder::class,
            IoTDeviceSeeder::class,
            RfidCardSeeder::class,
            PaymentSeeder::class,
            AccessLogSeeder::class,
            NotificationSeeder::class,
        ]);
    }
}
