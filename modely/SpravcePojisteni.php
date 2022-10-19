<?php

// Třída poskytuje metody pro správu článků v redakčním systému
class SpravcePojisteni
{
   /**
     * Vrátí seznam pojištění pro konkrétního pojištěnce
     */
    public function vratVsechnyProPojistence(int $id_pojistence) : array
    {
        return Db::dotazVsechny('
            SELECT *
            FROM `pojisteni`
            WHERE `pojistenec` = ?
        ', array($id_pojistence));
    }
    /**
     * vrátí seznam pojištění
     */
    public function vratVsechnyPojisteni($strana, $naStranu) : array 
    {
    return Db::dotazVsechny('
        SELECT `pojisteni`.`pojisteni_id`, `pojisteni`.`typ`, `pojisteni`.`pojistne`, `pojisteni`.`vznik`, `pojisteni`.`platnost`,
        `klient`.`klient_id`, CONCAT(`klient`.`jmeno`," ",`klient`.`prijmeni`) AS "jmeno", `uzivatel`.`uzivatel_id`
        FROM `pojisteni` JOIN `klient` ON `klient`.`klient_id` = `pojisteni`.`pojistenec` JOIN `uzivatel` ON `uzivatel`.`uzivatel_id` = `klient`.`uzivatel`
        ORDER BY `pojisteni`.`pojisteni_id` DESC LIMIT ?, ?;
        ', array(($strana - 1) * $naStranu, $naStranu));
    }
    /**
     * uloží pojištění do databáze
     */
    public function ulozPojisteni(int $id, array $pojisteni) : void
    {
        if (!$id)
            Db::vloz('pojisteni', $pojisteni);
        else
            Db::zmen('pojisteni', $pojisteni, 'WHERE pojisteni_id = ?', array($id));
    }
    /**
     * vrátí jedno pojištění podle id
     */
    public function vratPojisteni(string $pojisteni_id) : array
    {
        return Db::dotazJeden('
            SELECT *
            FROM `pojisteni`
            WHERE `pojisteni_id` = ?
        ', array($pojisteni_id));
    }
    /**
     * odstraní pojištění podle id
     */
    public function odstranPojisteni(string $id) : void
    {
        Db::dotaz('
            DELETE FROM `pojisteni`
            WHERE `pojisteni_id` = ?
        ', array($id));
    }
    /**
     * vrátí počet pojištění v databázi
     */
    function vratPocet() 
    {
        return Db::dotazJeden('SELECT COUNT(*) FROM `klient`;');
    }

}