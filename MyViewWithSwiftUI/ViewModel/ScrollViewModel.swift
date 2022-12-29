//
//  ScrollViewModel.swift
//  MyViewWithSwiftUI
//
//  Created by 원태영 on 2022/12/25.
//

import Foundation

class ScrollViewModel : ObservableObject {
    @Published var scrollModels: [ScrollModel]
    
    init(scrollModels: [ScrollModel] = []) {
        self.scrollModels = scrollModels
    }
}

let scrollModel1 = ScrollModel(
    id : UUID().uuidString,
    title: "사이트 소유권 - 이용 약관 동의",
    content: "본 이용 약관('이용 약관')은 www.apple.com의 Apple 웹 사이트 및 전 세계 Apple 사이트 등 Apple과 그 자회사 및 관계회사에 의해 www.apple.com에 연결된 모든 사이트(총칭 '사이트')에 적용됩니다.\n 사이트는 Apple Inc.('Apple') 및 그 사용권 부여자의 재산입니다. 사이트를 사용하면 본 이용 약관에 동의하는 것입니다. 동의하지 않는 경우 사이트를 사용하지 마십시오.\n\n\nApple은 단독 재량에 따라 언제든지 본 이용 약관의 일부를 변경, 수정, 추가 또는 제거할 권리를 가집니다. 본 이용 약관에 변경 사항이 있는지 주기적으로 확인할 책임은 귀하에게 있습니다. 변경 사항 게시 후 사이트를 계속 사용하면 변경 사항에 동의하는 것입니다. 귀하가 본 이용 약관을 준수하는 경우에 한해 Apple은 귀하에게 사이트에 접속하고 사이트를 사용할 수 있는 개인적이고 비독점적이며 양도 불가능하고 제한된 권한을 부여합니다.")

let scrollModel2 = ScrollModel(
    id : UUID().uuidString,
    title: "콘텐츠",
    content: "사이트에 포함된 모든 텍스트, 그래픽, 사용자 인터페이스, 시각적 인터페이스, 사진, 상표, 로고, 사운드, 음악, 아트워크 및 컴퓨터 코드(총칭 '콘텐츠')는 해당 콘텐츠의 디자인, 구조, 선택, 조정, 표현, '외관과 느낌(look and feel)' 및 배열을 포함하되 이에 국한되지 않으며 Apple이 소유 또는 통제하거나 사용권을 부여하거나 사용권을 가지고, 트레이드 드레스, 저작권, 특허 및 상표법과 기타 다양한 지적 재산권 및 불공정 경쟁법으로 보호됩니다.\n\n\n본 이용 약관에 명시적으로 규정된 경우를 제외하고 Apple의 명시적 사전 서면 동의 없이 사이트의 일부 및 콘텐츠를 다른 컴퓨터, 서버, 웹 사이트, 기타 게시 또는 배포 미디어나 기업체용 미디어에 어떤 식으로든('미러링' 포함) 복사, 재생산, 재발행, 업로드, 게시, 공개 전시, 인코딩, 번역, 전송 또는 배포해서는 안 됩니다.\n\n\n귀하는 (1) 해당 문서의 모든 사본에 포함된 소유권 고지 문구를 제거하지 않고 (2) 해당 정보를 개인적이고 비상업적인 정보 목적으로만 사용하며 해당 정보를 네트워크에 연결된 컴퓨터에 복사 또는 게시하거나 어떠한 매체에도 방송하지 않고 (3) 해당 정보를 수정하지 않고 (4) 해당 문서에 대한 추가 진술 또는 보증을 하지 않는 경우 Apple이 사이트에서 다운로드할 수 있도록 의도적으로 제공한 Apple 제품 및 서비스에 대한 정보(예: 데이터 시트, 기술 문서 및 유사한 자료)를 사용할 수 있습니다.")

let scrollModel3 = ScrollModel(
    id : UUID().uuidString,
    title: "귀하의 사이트 사용",
    content: "'딥 링크', '페이지 스크랩', '로봇', '스파이더' 또는 기타 자동 기기, 프로그램, 알고리즘 또는 방법론이나 그와 유사하거나 동등한 수동 절차를 사용하여 사이트 또는 콘텐츠의 일부에 접근하거나 이를 취득, 복사 또는 모니터링하거나, 사이트 또는 콘텐츠의 탐색 구조나 표현을 어떤 식으로든 복제하거나 우회함으로써 사이트를 통해 의도적으로 제공되지 않은 수단으로 자료, 문서 또는 정보를 획득하거나 획득하려고 시도해서는 안 됩니다. Apple은 해당 활동을 금지할 권리를 가집니다.\n\n\n해킹, 암호 '마이닝' 또는 기타 불법적인 수단을 통해 사이트의 일부나 기능, 사이트나 Apple 서버에 연결된 기타 시스템이나 네트워크, 사이트에서 또는 사이트를 통해 제공되는 서비스에 대한 무단 접근 권한을 얻으려고 시도해서는 안 됩니다.\n\n\n사이트 또는 사이트에 연결된 네트워크의 취약성을 탐지, 검사 또는 테스트하거나, 사이트 또는 사이트에 연결된 네트워크에 대한 보안 또는 인증 수단을 위반해서는 안 됩니다. 자신의 소유가 아닌 Apple 계정을 포함하여 사이트의 다른 사용자나 방문자 또는 Apple의 다른 고객에 대한 정보를 그 소스까지 역조회, 추적 또는 추적 시도하거나, 본인 정보를 제외하고 사이트에 의해 제공된 개인 신원 또는 정보를 포함하되 이에 국한되지 않는 정보를 공개할 목적으로 어떤 식으로든 사이트를 이용하거나 사이트에서 또는 사이트를 통해 사용할 수 있거나 제공되는 서비스 또는 정보를 이용해서는 안 됩니다.\n\n\n귀하는 사이트 또는 Apple의 시스템이나 네트워크, 사이트나 Apple에 연결된 시스템 또는 네트워크의 인프라에 부당하게 또는 형평에 맞지 않게 과도한 부하를 가하는 행위를 하지 않는 데 동의합니다.\n\n\n귀하는 기기, 소프트웨어 또는 루틴을 사용하여 사이트의 적절한 작동 또는 사이트에서 이루어지는 모든 거래 또는 다른 사람의 사이트 사용을 방해하거나 방해하려고 시도하지 않는 데 동의합니다.\n\n\n사이트에서 또는 사이트를 통해 전송하거나 사이트에서 또는 사이트를 통해 제공되는 서비스를 통해 Apple에 전송하는 메시지나 전송의 출처를 감추기 위해 제목을 위조하거나 다른 방식으로 식별자를 조작해서는 안 됩니다. 다른 사람으로 가장하거나 다른 사람을 대표한다고 가장하거나 다른 개인 또는 단체를 사칭해서는 안 됩니다.\n\n\n사이트 또는 콘텐츠를 불법적이거나 본 이용 약관에서 금지하는 목적으로 사용하거나 불법적인 활동 또는 Apple이나 타인의 권리를 침해하는 그 밖의 활동을 권유하기 위해 사용해서는 안 됩니다.")


let scrollModel4 = ScrollModel(
    id : UUID().uuidString,
    title: "피드백 및 정보",
    content: "이 사이트에서 귀하가 제공하는 모든 피드백은 기밀 정보가 아닌 것으로 간주됩니다. Apple은 해당 정보를 제한 없이 자유롭게 사용할 수 있습니다.\n\n이 웹 사이트에 포함된 정보는 예고 없이 변경될 수 있습니다.\n\nCopyright © 1997-2009 Apple Inc. 모든 권리 보유.\n\nApple Inc., One Apple Park Way, Cupertino, CA 95014, USA.\n\n2009년 11월 20일에 Apple 법무 팀이 업데이트함")
