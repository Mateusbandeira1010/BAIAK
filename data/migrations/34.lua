function onUpdateDatabase()
    db.query([[
        CREATE TABLE IF NOT EXISTS `castle` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `name` VARCHAR(255) NOT NULL DEFAULT '',
            `guild_id` INT NOT NULL DEFAULT 0
        ) ENGINE=InnoDB;
    ]])
    
    -- Insere uma linha vazia se a tabela estiver nova
    local resultId = db.storeQuery("SELECT COUNT(*) as count FROM `castle` ")
    if resultId then
        if result.getDataInt(resultId, "count") == 0 then
            db.query("INSERT INTO `castle` (`name`, `guild_id`) VALUES ('Ninguem', 0)")
        end
        result.free(resultId)
    end
    return true
end