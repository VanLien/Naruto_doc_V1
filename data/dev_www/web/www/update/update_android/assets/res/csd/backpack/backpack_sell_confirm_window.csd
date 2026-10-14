<GameFile>
  <PropertyGroup Name="backpack_sell_confirm_window" Type="Layer" ID="o1zk67qbm9rfjxicvldw843y-g05aupesnh2" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="799270371" Tag="78" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" ComboBoxIndex="1" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="0" R="0" />
          </AbstractNodeData>
          <AbstractNodeData Name="container" ActionTag="-1686886587" Tag="79" RotationSkewX="0" RotationSkewY="0" LeftMargin="20" RightMargin="20" TopMargin="442.5" BottomMargin="442.5" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="395" X="680" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="Image_1" ActionTag="333309340" Tag="80" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="21" RightEage="21" TopEage="21" BottomEage="21" Scale9OriginX="21" Scale9OriginY="21" Scale9Width="52" Scale9Height="54" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="395" X="680" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="340" Y="197.5" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1039.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="Image_2" ActionTag="-1978826990" Tag="81" RotationSkewX="0" RotationSkewY="0" LeftMargin="174" RightMargin="174" TopMargin="-22.952101" BottomMargin="354.952087" LeftEage="56" RightEage="56" TopEage="0" BottomEage="0" Scale9OriginX="56" Scale9OriginY="0" Scale9Width="47" Scale9Height="63" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="63" X="332" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="340" Y="386.452087" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1024.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="win_title" ActionTag="-1833658390" Tag="92" RotationSkewX="0" RotationSkewY="0" LeftMargin="286.5" RightMargin="286.5" TopMargin="-9" BottomMargin="372" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="32" X="107" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="340" Y="388" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="214" G="237" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="9" G="32" R="82" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="item_scrollview" ActionTag="-818545569" Tag="257" RotationSkewX="0" RotationSkewY="0" LeftMargin="40" RightMargin="40" TopMargin="91.346802" BottomMargin="173.653198" TouchEnable="True" BackColorAlpha="102" ScrollDirectionType="Vertical_Horizontal" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="ScrollViewObjectData">
                <Size Y="130" X="600" />
                <AnchorPoint ScaleX="0.5" ScaleY="1" />
                <Position X="340" Y="303.653198" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="100" G="150" R="255" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="100" G="150" R="255" />
                <InnerNodeSize Height="130" Width="600" />
              </AbstractNodeData>
              <AbstractNodeData Name="cancel_btn" ActionTag="682389604" Tag="313" RotationSkewX="0" RotationSkewY="0" LeftMargin="88" RightMargin="428" TopMargin="291.566406" BottomMargin="42.433601" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="20" BottomEage="20" Scale9OriginX="17" Scale9OriginY="20" Scale9Width="30" Scale9Height="23" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="61" X="164" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="170" Y="72.933601" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1018.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="-1331481336" Tag="94" RotationSkewX="0" RotationSkewY="0" LeftMargin="54" RightMargin="54" TopMargin="14.5" BottomMargin="14.5" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="32" X="56" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="82" Y="30.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="21" G="74" R="41" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="confirm_btn" ActionTag="1459867171" Tag="391" RotationSkewX="0" RotationSkewY="0" LeftMargin="428" RightMargin="88" TopMargin="291.566406" BottomMargin="42.433601" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="20" BottomEage="20" Scale9OriginX="17" Scale9OriginY="20" Scale9Width="30" Scale9Height="23" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="61" X="164" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="510" Y="72.933601" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1017.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="-469766834" Tag="95" RotationSkewX="0" RotationSkewY="0" LeftMargin="54.501301" RightMargin="54.498699" TopMargin="14.5023" BottomMargin="14.4977" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="32" X="55" />
                    <AnchorPoint ScaleX="0.5617" ScaleY="0.7557" />
                    <Position X="85.394798" Y="38.680099" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="25" G="69" R="118" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="sell_title" ActionTag="-1552702465" Tag="394" RotationSkewX="0" RotationSkewY="0" LeftMargin="165" RightMargin="165" TopMargin="46.440102" BottomMargin="320.559906" FontSize="26" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="28" X="350" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="340" Y="334.559906" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="35" G="50" R="100" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="sell_desc" ActionTag="766389576" Tag="393" RotationSkewX="0" RotationSkewY="0" LeftMargin="118.5" RightMargin="118.5" TopMargin="246.200806" BottomMargin="122.799202" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="26" X="443" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="340" Y="135.799194" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="34" G="83" R="149" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
