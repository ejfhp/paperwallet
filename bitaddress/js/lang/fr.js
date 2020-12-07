(function (translator) {
	translator.translations["fr"] = {
		// javascript alerts or messages
		"testneteditionactivated": "ÉDITION TESTNET ACTIVÉE",
		"paperlabelbitcoinaddress": "Adresse Bitcoin:",
		"paperlabelprivatekey": "Clé Privée:",
		"paperlabelencryptedkey": "Encrypted Private Key (Password required)", //TODO: please translate
		"bulkgeneratingaddresses": "Création de l'adresse... ",
		"brainalertpassphrasetooshort": "Le mot de passe que vous avez entré est trop court.\n\n",
		"brainalertpassphrasewarning": "Brainwallet est très risqué, si votre phrase de passe n'est pas super complexe / longue / unique, il est très probable qu'elle soit devinée par des robots de force brute et votre bitcoin sera volé. Faites attention!",
		"brainalertpassphrasedoesnotmatch": "Le mot de passe ne correspond pas au mot de passe de vérification.",
		"detailalertnotvalidprivatekey": "Le texte que vous avez entré n'est pas une Clé Privée valide",
		"detailconfirmsha256": "Le texte que vous avez entré n'est pas une Clé Privée valide!\n\nVoulez-vous utiliser le texte comme un mot de passe et créer une Clé Privée à partir d'un hash SHA256 de ce mot de passe?\n\nAttention: Choisir un mot de passe solide est important pour vous protéger des attaques bruteforce visant à trouver votre mot de passe et voler vos Bitcoins.",
		"bip38alertincorrectpassphrase": "Incorrect passphrase for this encrypted private key.", //TODO: please translate
		"bip38alertpassphraserequired": "Mot de passe a inventé pour crypter en BIP38",
		"vanityinvalidinputcouldnotcombinekeys": "Entrée non valide. Impossible de combiner les clés.",
		"vanityalertinvalidinputpublickeysmatch": "Entrée non valide. La clé publique des deux entrées est identique. Vous devez entrer deux clés différentes.",
		"vanityalertinvalidinputcannotmultiple": "Entrée non valide. Il n'est pas possible de multiplier deux clés publiques. Sélectionner 'Ajouter' pour ajouter deux clés publiques pour obtenir une adresse Bitcoin.",
		"vanityprivatekeyonlyavailable": "Seulement disponible si vos combinez deux clés privées",
		"vanityalertinvalidinputprivatekeysmatch": "Entrée non valide. La clé Privée des deux entrées est identique. Vous devez entrer deux clés différentes.",

		// header and menu html
		"tagline": "Générateur De Porte-Monnaie Bitcoin Javascript Hors-Ligne",
		"generatelabelbitcoinaddress": "Création de l'adresse Bitcoin...",
		"generatelabelmovemouse": "BOUGEZ votre souris pour ajouter de l'entropie...",
		"generatelabelkeypress": "OU veuillez taper des caractères aléatoires dans le rectangle blanc suivant",
		"singlewallet": "Porte-Monnaie Simple",
		"paperwallet": "Porte-Monnaie Papier",
		"bulkwallet": "Porte-Monnaie En Vrac",
		"brainwallet": "Porte-Monnaie Cerveau",
		"vanitywallet": "Porte-Monnaie Vanité",
		"splitwallet": "Split Wallet", //TODO: please translate
		"detailwallet": "Détails du Porte-Monnaie",

		// footer html
		"footerlabelgithubzip": "zip",
		"footerlabelcopyright": "Pour obtenir tous les droits d'auteur, consultez GitHub Repository. À utiliser à vos risques et périls.",

		// status html
		"statuslabelcryptogood": "&#10004; Good!", //TODO: please translate
		"statuslabelcryptogood1": "Your browser can generate cryptographically random keys using window.crypto.getRandomValues", //TODO: please translate
		"statusokcryptogood": "OK", //TODO: please translate
		"statuslabelcryptobad": "&times; Oh no!", //TODO: please translate
		"statuslabelcryptobad1": "Your browser does NOT support window.crypto.getRandomValues. You should use a more modern browser with this generator to increase the security of the keys generated.",
		"statusokcryptobad": "OK", //TODO: please translate
		"statuslabelunittestsgood": "&#10004; Good!", //TODO: please translate
		"statuslabelunittestsgood1": "All synchronous unit tests passed.", //TODO: please translate
		"statusokunittestsgood": "OK", //TODO: please translate
		"statuslabelunittestsbad": "&times; Oh no!", //TODO: please translate
		"statuslabelunittestsbad1": "Some synchronous unit tests DID NOT pass. You should find another browser to use with this generator.", //TODO: please translate
		"statusokunittestsbad": "OK", //TODO: please translate
		"statuslabelprotocolgood": "&#10004; Good!", //TODO: please translate
		"statuslabelprotocolgood1": "You are running this generator from your local computer. <br />Tip: Double check you are offline by trying ", //TODO: please translate
		"statusokprotocolgood": "OK", //TODO: please translate
		"statuslabelprotocolbad": "&#9888; Think twice!", //TODO: please translate
		"statuslabelprotocolbad1": "You appear to be running this generator online from a live website. For valuable wallets it is recommended to", //TODO: please translate
		"statuslabelprotocolbad2": "download", //TODO: please translate
		"statuslabelprotocolbad3": "the zip file from GitHub and run this generator offline as a local html file.", //TODO: please translate
		"statusokprotocolbad": "OK", //TODO: please translate
		"statuslabelkeypool1": "This is a log of all the Bitcoin Addresses and Private Keys you generated during your current session. Reloading the page will create a new session.", //TODO: please translate
		"statuskeypoolrefresh": "Refresh", //TODO: please translate
		"statusokkeypool": "OK", //TODO: please translate

		// single wallet html
		"newaddress": "Générer Une Nouvelle Adresse",
		"singleprint": "Imprimer",
		"singlelabelbitcoinaddress": "Adresse Bitcoin:",
		"singlelabelprivatekey": "Clé Privée (Format d'importation de porte-monnaie):",
		"singletip": "<b>Un porte-monnaie Bitcoin</b> est aussi simple qu'une paire d'adresses Bitcoin dont une correspond à l'adresse privée Bitcoin. Ce porte-monnaie affiché a été généré pour vous dans votre propre navigateur internet et est donc affiché ci-dessus.",
		"singleshare": "PARTAGER",
		"singlesecret": "SECRET",

		// paper wallet html
		"paperlabelhideart": "Enlever l'image ?",
		"paperlabeladdressesperpage": "Adresses par page:",
		"paperlabeladdressestogenerate": "Nombre d'adresses à créer:",
		"papergenerate": "Générer",
		"paperprint": "Imprimer",
		"paperlabelBIPpassphrase": "mot de passe:",
		"paperlabelencrypt": "Cryptage en BIP38 ?", //TODO: please translate

		// bulk wallet html
		"bulklabelstartindex": "Commencer à l'index:",
		"bulklabelrowstogenerate": "Colonnes à générer:",
		"bulklabelcompressed": "Compressed addresses?", //TODO: please translate
		"bulkgenerate": "Générer",
		"bulkprint": "Imprimer",
		"bulklabelcsv": "Valeurs Séparées Par Des Virgules (CSV):",
		"bulklabelformat": "Index,Adresse,Clé Privée (WIF)",
		"bulklabelq1": "Pourquoi utiliserais-je un Porte-monnaie en vrac pour accepter les Bitcoins sur mon site web?",
		"bulka1": "L'approche traditionnelle pour accepter des Bitcoins sur votre site web requière l'installation du logiciel Bitcoin officiel (\"bitcoind\"). Plusieurs hébergeurs ne supportent pas l'installation du logiciel Bitcoin. De plus, faire fonctionner le logiciel Bitcoin sur votre serveur web signifie que vos clés privées sont hébergées sur le serveur et pourraient donc être volées si votre serveur web était compromis. En utilisant un Porte-monnaie en vrac, vous pouvez publiquer seulement les adresses Bitcoin sur votre serveur et non les clés privées. Vous n'avez alors pas à vous inquiéter du risque de vous faire voler votre porte-monnaie si votre serveur était compromis.",
		"bulklabelq2": "Comment utiliser le Porte-monnaie en vrac pour utiliser le Bitcoin sur mon site web?",
		"bulklabela2li1": "Utilisez le Porte-monnaie en vrac pour pré-générer une large quantité d'adresses Bitcoin (10,000+). Copiez collez les données séparées par des virgules (CSV) dans un fichier texte sécurisé dans votre ordinateur. Sauvegardez ce fichier dans un endroit sécurisé.",
		"bulklabela2li2": "Importez les adresses Bitcoin dans une base de donnée sur votre serveur web. (N'ajoutez pas le porte-monnaie ou les clés privées sur votre serveur web, sinon vous courrez le risque de vous faire voler si votre serveur est compromis. Ajoutez seulement les adresses Bitcoin qui seront visibles à vos visiteurs.)",
		"bulklabela2li3": "Ajoutez une option dans votre panier en ligne pour que vos clients puissent vous payer en Bitcoin. Quand un client choisi de vous payer en Bitcoin, vous pouvez afficher une des adresses de votre base de donnée comme \"adresse de paiment\" pour votre client et sauvegarder cette adresse avec sa commande.",
		"bulklabela2li4": "Vous avez maintenant besoin d'être avisé quand le paiement est reçu. Cherchez \"bitcoin payment notification\" sur Google et inscrivez-vous à un service de notification de paiement Bitcoin. Il y a plusieurs services qui vous avertiront via des services Web, API, SMS, Email, etc. Une fois que vous avez reçu la notification, qui devrait être programmée automatiquement, vous pouvez traiter la commande de votre client. Pour vérifier manuellement si un paiement est arrivé, vous pouvez utiliser Block Explorer. Remplacez ADRESSE par l'adresse Bitcoin que vous souhaitez vérifier. La confirmation de la transaction pourrait prendre de 10 à 60 minutes pour être confirmée.<br />http://www.blockexplorer.com/address/ADRESSE<br /><br />Les transactions non confirmées peuvent être visualisées ici: http://blockchain.info/ <br />Vous devriez voir la transaction à l'intérieur de 30 secondes.",
		"bulklabela2li5": "Les Bitcoins vos s'accumuler de façon sécuritaire dans la chaîne de blocs. Utilisez le porte-monnaie original que vous avez généré à l'étape 1 pour les dépenser.",

		// brain wallet html
		"brainlabelenterpassphrase": "Entrez votre mot de passe: ",
		"brainlabelshow": "Afficher?",
		"brainprint": "Imprimer",
		"brainlabelconfirm": "Confirmer le mot de passe: ",
		"brainview": "Visualiser",
		"brainalgorithm": "Algorithme: SHA256(mot de passe)",
		"brainlabelbitcoinaddress": "Adresse Bitcoin:",
		"brainlabelprivatekey": "Clé Privée (Format d'importation de porte-monnaie):",

		// vanity wallet html
		"vanitylabelstep1": "Étape 1 - Générer votre \"Étape 1 Paire De Clés\"",
		"vanitynewkeypair": "Générer",
		"vanitylabelstep1publickey": "Étape 1 Clé Publique:",
		"vanitylabelstep1pubnotes": "Copiez celle-ci dans la case Votre-Clé-Publique du site de Vanity Pool.",
		"vanitylabelstep1privatekey": "Step 1 Clé Privée:",
		"vanitylabelstep1privnotes": "Copiez la cette Clé Privée dans un fichier texte. Idéalement, sauvegardez la dans un fichier encrypté. Vous en aurez besoin pour récupérer la Clé Privée lors que Vanity Pool aura trouvé votre préfixe.",
		"vanitylabelstep2calculateyourvanitywallet": "Étape 2 - Calculer votre Porte-monnaie Vanité",
		"vanitylabelenteryourpart": "Entrez votre Clé Privée (générée à l'étape 1 plus haut et précédemment sauvegardée):",
		"vanitylabelenteryourpoolpart": "Entrez la Clé Privée (provenant de Vanity Pool):",
		"vanitylabelnote1": "[NOTE: cette case peut accepter une clé publique ou un clé privée]",
		"vanitylabelnote2": "[NOTE: cette case peut accepter une clé publique ou un clé privée]",
		"vanitylabelradioadd": "Ajouter",
		"vanitylabelradiomultiply": "Multiplier",
		"vanitycalc": "Calculer Le Porte-monnaie Vanité",
		"vanitylabelbitcoinaddress": "Adresse Bitcoin Vanité:",
		"vanitylabelnotesbitcoinaddress": "Ci-haut est votre nouvelle adresse qui devrait inclure le préfix requis.",
		"vanitylabelpublickeyhex": "Clé Public Vanité (HEX):",
		"vanitylabelnotespublickeyhex": "Celle-ci est la Clé Publique dans le format hexadécimal. ",
		"vanitylabelprivatekey": "Clé Privée Vanité (WIF):",
		"vanitylabelnotesprivatekey": "Celle-ci est la Clé Privée pour accéder à votre porte-monnaie. ",

		// detail wallet html
		"detaillabelenterprivatekey": "Entrez la Clé Privée",
		"detailkeyformats": "Key Formats: WIF, WIFC, HEX, B64, B6, MINI, BIP38",
		"detailview": "Voir les détails",
		"detailprint": "Imprimer",
		"detaillabelnote1": "Votre Clé Privée Bitcoin est un nombre secret que vous êtes le seul à connaître. Il peut être encodé sous la forme d'un nombre sous différents formats. Ci-bas, nous affichons l'adresse Bitcoin et la Clé Publique qui corresponds à la Clé Privée ainsi que la Clé Privée dans les formats d'encodage les plus populaires (WIF, WIFC, HEX, B64).",
		"detaillabelnote2": "Bitcoin conserve les clés publiques dans un format compressé. Le logiciel supporte maintenant aussi l'importation et l'exportation de clés privées avec importprivkey/dumpprivkey. Le format de la clé privée exportée est déterminé selon la version du porte-monnaie Bitcoin.",
		"detaillabelbitcoinaddress": "Adresse Bitcoin:",
		"detaillabelbitcoinaddresscomp": "Adresse Bitcoin (compressée):",
		"detaillabelpublickey": "Clé Publique (130 caractères [0-9A-F]):",
		"detaillabelpublickeycomp": "Clé Publique (compressée, 66 caractères [0-9A-F]):",
		"detaillabelprivwif": "Clé Privée WIF (51 caractères base58, débute avec un a",
		"detaillabelprivwifcomp": "Clé Privée WIF (compressée, 52 caractères base58, débute avec un a",
		"detailcompwifprefix": "'K' ou 'L'",
		"detaillabelprivhex": "Clé Privée Format Hexadecimal (64 caractères [0-9A-F]):",
		"detaillabelprivb64": "Clé Privée Base64 (44 caractères):",
		"detaillabelprivmini": "Clé Privée Format Mini (22, 26 ou 30 caractères, débute avec un 'S'):",
		"detaillabelpassphrase": "BIP38 Passphrase", //TODO: please translate
		"detailbip38decryptbutton": "Decrypt BIP38", //TODO: please translate
		"detailbip38encryptbutton": "Encrypt BIP38", //TODO: please translate
		"detaillabelq1": "How do I make a wallet using dice? What is B6?", //TODO: please translate
		"detaila1": "An important part of creating a Bitcoin wallet is ensuring the random numbers used to create the wallet are truly random. Physical randomness is better than computer generated pseudo-randomness. The easiest way to generate physical randomness is with dice. To create a Bitcoin private key you only need one six sided die which you roll 99 times. Stopping each time to record the value of the die. When recording the values follow these rules: 1=1, 2=2, 3=3, 4=4, 5=5, 6=0. By doing this you are recording the big random number, your private key, in B6 or base 6 format. You can then enter the 99 character base 6 private key into the text field above and click View Details. You will then see the Bitcoin address associated with your private key. You should also make note of your private key in WIF format since it is more widely used." //TODO: please translate
	};
})(ninja.translator);