<?php

// Třída poskytuje metody pro správu článků v redakčním systému
class SpravcePojistencu
{

    /**
     * Vrátí článek z databáze podle jeho URL
     */
    public function vratPojistence(string $klient_id) : array
    {
        return Db::dotazJeden('
            SELECT *
            FROM `klient`
            WHERE `klient_id` = ?
        ', array($klient_id));
    }
    /**
     * vrátí adresu podle id
     */
    public function vratAdresu(string $adresa_id) : array
    {
        return Db::dotazJeden('
            SELECT *
            FROM `adresa`
            WHERE `adresa_id` = ?
        ', array($adresa_id));
    }

    /**
     * vrátí všechny adresy 
     */
    public function vratVsechny($strana, $naStranu) : array
    {
        return Db::dotazVsechny('
        SELECT `klient_id`, CONCAT(`klient`.`jmeno`," ",`klient`.`prijmeni`) AS "jmeno", 
        CONCAT(`adresa`.`ulice`, " ", `adresa`.`cislo_popisne`,", ", `adresa`.`mesto`, "  ", `adresa`.`PSC`) AS "adresa",
        `uzivatel`, `telefon`, `email`
         FROM `klient` JOIN `adresa` ON `adresa`.`adresa_id` = `klient`.`adresa` ORDER BY `klient_id` DESC LIMIT ?, ?;
        ', array(($strana - 1) * $naStranu, $naStranu) );
    }
    /**
     * uložení pojištěnce do databáze
     */
    public function ulozPojistence(int $id, array $pojistenec) : void
    {
        if (!$id)
            Db::vloz('klient', $pojistenec);
        else
            Db::zmen('klient', $pojistenec, 'WHERE klient_id = ?', array($id));
    }
    /**
     * odstraní pojištěnce z databáze
     */
    public function odstranPojistence(string $id) : void
    {
        Db::dotaz('
            DELETE FROM klient
            WHERE klient_id = ?
        ', array($id));
    }
    /**
     * zjistí zda zadaná adresa je již uložena v databázi
     */
    public function zdaExistuje(array $adresa) : array
    {
        return Db::dotazJeden('
        SELECT EXISTS(SELECT * FROM `adresa` WHERE `ulice` = ? AND 
        `cislo_popisne` = ? AND `mesto` = ? AND `PSC` = ?);
        ', array($adresa['ulice'], $adresa['cislo_popisne'], $adresa['mesto'], $adresa['PSC']));
    }
    /**
     * zjistí id zadané adresy
     */
    public function zjistiAdresu(array $adresa) : array|bool
    {
        return Db::dotazJeden('
        SELECT `adresa_id` FROM `adresa` WHERE `ulice` = ? AND 
        `cislo_popisne` = ? AND `mesto` = ? AND `PSC` = ?;
        ', array($adresa['ulice'], $adresa['cislo_popisne'], $adresa['mesto'], $adresa['PSC']));
    }
    /**
     * uloží adresu do databáze
     */
    public function ulozAdresu(array $adresa) : int
    {
        Db::vloz('adresa', $adresa);
        return Db::posledniID();
    }
    /**
     * vrátí počet adres v databázi
     */
    function vratPocet() {
        return Db::dotazJeden('SELECT COUNT(*) FROM `klient`;');
    }

}