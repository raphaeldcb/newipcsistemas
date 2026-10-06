<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $admin = User::firstOrCreate(
            ['email' => env('APP_ADMIN_EMAIL', 'admin@ipcms.com.br')],
            [
                'name' => env('APP_ADMIN_NAME', 'Administrador'),
                'password' => Hash::make(env('APP_ADMIN_PASSWORD', 'admin123')),
                'role' => 'admin',
                'is_active' => true,
                'email_verified_at' => now(),
            ]
        );

        if ($admin->wasRecentlyCreated) {
            $this->command->info("✅ Usuário admin criado: {$admin->email}");
        } else {
            $this->command->info("ℹ️  Usuário admin já existe: {$admin->email}");
        }
    }
}
