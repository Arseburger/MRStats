import Foundation

class DI {
    static let shared = DI()
    
    private lazy var configuration: NetworkConfiguration = {
        NetworkConfiguration()
    }()
    
    private lazy var service: NetworkService = {
        NetworkService(configuration: configuration)
    }()
    
    lazy var heroesService: HeroesService = {
        HeroesService(service: service)
    }()
    
    lazy var mapsService: MapsService = {
        MapsService(service: service)
    }()
    
    lazy var playersService: PlayersService = {
        PlayersService(service: service)
    }()

    lazy var imageLoader: ImageLoader = {
        ImageLoader()
    }()
    
    lazy var cooldownManager: CooldownManager = {
        CooldownManager()
    }()
    
    lazy var bannerManager: BannerManager = {
        BannerManager()
    }()
    
    lazy var alertManager: AlertManager = {
        AlertManager()
    }()
    
    lazy var searchHistoryStore: SearchHistoryStore = {
        SearchHistoryStore()
    }()
}
