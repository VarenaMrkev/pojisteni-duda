<?php
// Správce uživatelů redakčního systému
class SpravceUzivatelu
{

    /**
     * vrátí otisk hesla
    */
    public function vratOtisk(string $heslo) : string
    {
        return password_hash($heslo, PASSWORD_DEFAULT);
    }

    /**
     * registruje nového uživatele do systému
     */
    public function registruj(string $jmeno, string $heslo, string $hesloZnovu) : void
    {
        if ($heslo != $hesloZnovu)
            throw new ChybaUzivatele('Hesla nesouhlasí.');
        $uzivatel = array(
            'jmeno' => $jmeno,
            'heslo' => $this->vratOtisk($heslo),
        );
        try
        {
            Db::vloz('uzivatel', $uzivatel);
        }
        catch (PDOException $chyba)
        {
            throw new ChybaUzivatele('Uživatel s tímto jménem je již zaregistrovaný.');
        }
    }

    /**
     * přihlásí uživatele do systému
     */
    public function prihlas(string $jmeno, string $heslo) : void
    {
        $uzivatel = Db::dotazJeden('
            SELECT uzivatel_id, jmeno, heslo, admin
            FROM uzivatel
            WHERE jmeno = ?
        ', array($jmeno));
        if (!$uzivatel || !password_verify($heslo, $uzivatel['heslo']))
            throw new ChybaUzivatele('Neplatné jméno nebo heslo.');
        $_SESSION['uzivatel'] = $uzivatel;
    }

    /**
     * odhlásí uživatele
     */
    public function odhlas() : void
    {
        unset($_SESSION['uzivatel']);
    }

    /**
     * vrátí aktuálně přihlášeného uživatele
     */
    public function vratUzivatele() : ?array
    {
        if (isset($_SESSION['uzivatel']))
            return $_SESSION['uzivatel'];
        return null;
    }
    /**
     * odstraní uživatele
     */
    public function odsranUzivatele(string $id) : void
    {
        Db::dotaz('
            DELETE FROM uzivatel
            WHERE uzivatel_id = ?
        ', array($id));
    }
    /**
     * vrátí seznam všech uživatelů
     */
    public function vratVsechny($strana, $naStranu) : array
    {
        return Db::dotazVsechny('
        SELECT `uzivatel_id`, jmeno, admin 
         FROM `uzivatel` ORDER BY `uzivatel_id` DESC LIMIT ?, ?;
        ', array(($strana - 1) * $naStranu, $naStranu));
    }
    /**
     * vrátí jednoho uživatele podle id
     */
    public function vratJednohoUzivatele(int $id) : array
    {
        return Db::dotazJeden('
            SELECT *
            FROM `uzivatel`
            WHERE `uzivatel_id` = ?
        ', array($id));
    }
    /**
     * nastaví administrátorské oprávnění
     */
    public function zmenOpravneni(int $id, array $uzivatel)
    {
        print_r($uzivatel);
        Db::zmen('uzivatel', $uzivatel, 'WHERE uzivatel_id = ?', array($id));
    }
    /**
     * změní heslo uživatele
     */
    public function zmenHeslo(int $id, array $uzivatel)
    {
        Db::zmen('uzivatel', $uzivatel, 'WHERE uzivatel_id = ?', array($id));
    }
    /**
     * vrátí počet užvatelů v databázi
     */
    function vratPocet() 
    {
        return Db::dotazJeden('SELECT COUNT(*) FROM `klient`;');
    }
}